"
I generate the FAME model from the annotations that are described in the Moose Model smalltalk classes.

I do the parsing of the pragmas of the methods defined in the classes and a create the instance of the entities of the meta meta model.

I collaborate with the MooseModel resetMeta.

Public API and Key Messages

- run (no setters I worked on the whole image (it seems to))

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	classDict:		<Object>
	elements:		<Object>
	metaDict:		<Object>
	mmClassDict:		<Object>
	oppositeDict:		<Object>
	packMetaDict:		<Object>
	packPropDict:		<Object>
	packageDict:		<Object>
	queue:		<Object>
	superclassDict:		<Object>
	typeDict:		<Object>


    Implementation Points
"
Class {
	#name : #FMPragmaProcessor,
	#superclass : #Object,
	#instVars : [
		'elements',
		'packageDict',
		'classDict',
		'metaDict',
		'superclassDict',
		'typeDict',
		'oppositeDict',
		'mmClassDict',
		'queue',
		'implementingPackages',
		'packDict',
		'traitsDict'
	],
	#classVars : [
		'ShouldValidateMetaModel'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'class initialization' }
FMPragmaProcessor class >> initialize [
	self shouldValidateMetaModel: true
]

{ #category : #accessing }
FMPragmaProcessor class >> shouldValidateMetaModel [
	self flag: #todo.	"This is a temporary solution for people who do not need a coherent meta model. It should be removed after Moose is improved in the area of the meta model building."
	^ ShouldValidateMetaModel
]

{ #category : #accessing }
FMPragmaProcessor class >> shouldValidateMetaModel: anObject [
	ShouldValidateMetaModel := anObject
]

{ #category : #converting }
FMPragmaProcessor >> asMetamodel [
	^ (FMMetaRepository with: FMMetaRepository fm3)
		addAll: elements;
		yourself
]

{ #category : #converting }
FMPragmaProcessor >> asTower [
	"This creation code might eventually end up in Tower or Repository,
	just let it grow, it will find its proper place over time."

	| mm |
	mm := self asMetamodel.
	^ FMTower new
		metaMetamodel: mm metamodel;
		metamodel: mm;
		model: (FMRepository with: mm);
		yourself
]

{ #category : #running }
FMPragmaProcessor >> buildFM3 [

	self queue: FM3Element.
	self queue: FM3Class.
	self queue: FM3Package.
	self queue: FM3Property.
	self run.
]

{ #category : #accessing }
FMPragmaProcessor >> classes [
	^ elements select: [ :e | e isFM3Class ]
]

{ #category : #accessing }
FMPragmaProcessor >> elements [
	^ elements
]

{ #category : #private }
FMPragmaProcessor >> ensureClass: var [
	var isBehavior ifTrue: [ ^ classDict at: var ].
	var isSymbol ifTrue: [ ^ classDict at: (self class environment at: var) ifAbsent: [ metaDict at: var asString ] ].
	var isString ifTrue: [ ^ metaDict at: var ].
	self assert: false
]

{ #category : #private }
FMPragmaProcessor >> ensurePackage: name [
	| symbol |
	self assert: (name isSymbol or: [ name isString ]).
	symbol := name asString.
	^ packageDict
		at: symbol
		ifAbsentPut: [ | pack |
			pack := FM3Package named: symbol.
			elements add: pack.
			pack ]
]

{ #category : #private }
FMPragmaProcessor >> extractPackageFrom: method for: aFM3Element [
	^ (method pragmaAt: #package:) ifNotNil: [ :p | packDict at: aFM3Element put: (p argumentAt: 1) ]
]

{ #category : #running }
FMPragmaProcessor >> implementingPackages [
	^ implementingPackages ifNil: [ implementingPackages := queue collectAsSet: #package ]
]

{ #category : #running }
FMPragmaProcessor >> implementingPackages: aColl [
	implementingPackages := aColl
]

{ #category : #initialization }
FMPragmaProcessor >> initialize [
	"Used for queuing classes before running."

	queue := OrderedCollection new.
	"Used to store resulting FM3 elements."
	elements := OrderedCollection new.
	"Several dictionaries ... see #resolveObjectReference"
	packageDict := Dictionary new.
	classDict := Dictionary new.
	superclassDict := IdentityDictionary new.
	packDict := IdentityDictionary new.
	typeDict := IdentityDictionary new.
	oppositeDict := IdentityDictionary new.
	mmClassDict := IdentityDictionary new.
	metaDict := Dictionary new.
	traitsDict := IdentityDictionary new.

	"Must use the cannonical primitives here!"
	"Please do not at these primitives to elements!"
	metaDict at: 'String' put: FM3Class string.
	metaDict at: 'Boolean' put: FM3Class boolean.
	metaDict at: 'Number' put: FM3Class number.
	metaDict at: 'Object' put: FM3Class object
]

{ #category : #private }
FMPragmaProcessor >> methodsToProcessFrom: aClass [
	"We need to process the methods from the class and the extensions methods comming from the packages containing the entites. We should reject extension methods comming from other packages."

	^ aClass localMethods select: [ :method | method isExtension not or: [ self implementingPackages includes: method package ] ]
]

{ #category : #accessing }
FMPragmaProcessor >> oppositeDict [
	^ oppositeDict
]

{ #category : #accessing }
FMPragmaProcessor >> packages [
	^ elements select: [ :e | e isFM3Package ]
]

{ #category : #private }
FMPragmaProcessor >> processClass: aClass [
	^ self processClass: aClass ifPragmaAbsent: [ self error: 'Fame Undeclared class ' , aClass name ]
]

{ #category : #private }
FMPragmaProcessor >> processClass: aClass ifPragmaAbsent: anErrorBlock [
	aClass metamodelDefinitionPragma
		ifNil: anErrorBlock
		ifNotNil: [ :pragma | 
			| fm3Class |
			fm3Class := FM3Class named: (pragma argumentAt: 1).
			superclassDict at: fm3Class put: (pragma argumentAt: 2).
			fm3Class setImplementingClass: aClass.

			(pragma method pragmaAt: #abstract) ifNotNil: [ fm3Class isAbstract: true ].
			self extractPackageFrom: pragma method for: fm3Class.
			classDict at: aClass put: fm3Class.
			(self methodsToProcessFrom: aClass) do: [ :each | self processCompiledMethod: each ].
			aClass localSlots select: #isFMRelationSlot thenDo: [ :each | self processSlot: each in: aClass ].

			traitsDict at: fm3Class put: aClass allGeneratedTraits.

			elements add: fm3Class ]
]

{ #category : #private }
FMPragmaProcessor >> processCompiledMethod: aMethod [
	| method |
	method := aMethod.

	"If the method is a reflective method we need to ensure it is compiled and use its compiled method.
	A refelctive method is for exemple a method created via a metalink and that was never executed."
	(aMethod isKindOf: ReflectiveMethod)
		ifTrue: [ method := aMethod
				compileAndInstallCompiledMethod;
				compiledMethod ].
	self assert: method isCompiledMethod.

	method pragmas
		detect: [ :each | #(#MSEProperty:type:opposite: #MSEProperty:type:) includes: each selector ]
		ifFound: [ :pragma | 
			| prop |
			prop := FM3Property named: (pragma argumentAt: 1) asString.
			typeDict at: prop put: (pragma argumentAt: 2).
			mmClassDict at: prop put: method methodClass.
			pragma selector = #MSEProperty:type:opposite: ifTrue: [ oppositeDict at: prop put: (pragma argumentAt: 3) ].
			self processInfosFrom: method for: prop.

			elements add: prop ]
]

{ #category : #private }
FMPragmaProcessor >> processInfosFrom: aMethod for: prop [
	prop setImplementingSelector: aMethod selector.
	self extractPackageFrom: aMethod for: prop.
	(aMethod pragmaAt: #container) ifNotNil: [ prop isContainer: true ].
	(aMethod pragmaAt: #derived) ifNotNil: [ prop isDerived: true ].
	(aMethod pragmaAt: #source) ifNotNil: [ prop isSource: true ].
	(aMethod pragmaAt: #target) ifNotNil: [ prop isTarget: true ].
	(aMethod pragmaAt: #multivalued)
		ifNotNil: [ self flag: #todo.	"This should maybe be moved to FMMetamodelValidator."
			self
				assert: prop isContainer not
				description: 'It is not possible to have <multivalue> and <container> on the same method. container represents a aggregation UML link that is incompatible with the multivalue kind of the link'.
			prop isMultivalued: true ].
	(aMethod pragmaAt: #key:) ifNotNil: [ :p | prop key: (p argumentAt: 1) ]
]

{ #category : #private }
FMPragmaProcessor >> processSlot: aSlot in: aClass [
	| prop |
	prop := FM3Property named: aSlot name.
	prop setImplementingSelector: aSlot name.
	prop isMultivalued: aSlot isToMany.

	typeDict at: prop put: aSlot targetClass.
	mmClassDict at: prop put: aClass.
	oppositeDict at: prop put: aSlot inverseName.

	aClass compiledMethodAt: aSlot name asSymbol ifPresent: [ :aMethod | self processInfosFrom: aMethod for: prop ].

	elements add: prop
]

{ #category : #accessing }
FMPragmaProcessor >> properties [
	^ elements select: [ :e | e isFM3Property ]
]

{ #category : #running }
FMPragmaProcessor >> queue: var [
	"Add one or many classes to be processed. Nothing is done before the run method is called"

	var isBehavior  
		ifTrue: [
			queue add: var.
			^self ].
	var isCollection
		ifTrue: [
			var do: [ :each | self queue: each ].
			^self ].
	
	[ false ] assert.
]

{ #category : #private }
FMPragmaProcessor >> resolveObjectReferences [

	"establish class-package and property-package links"
	packDict keysAndValuesDo: [ :fm3Element :value | fm3Element package: (self ensurePackage: value) ].

	"establish property-class associations"
	mmClassDict keysAndValuesDo: [ :prop :value | prop mmClass: (self ensureClass: value) ].

	"map classes by full name"
	self classes do: [ :meta | metaDict at: meta fullName asString put: meta ].

	"establish class-superclass associations"
	superclassDict keysAndValuesDo: [ :meta :value | meta superclass: (self ensureClass: value) ].

	"establish property-type-opposite relations"
	typeDict keysAndValuesDo: [ :prop :value | prop type: (self ensureClass: value) ].

	"establish class-traits relations"
	traitsDict keysAndValuesDo: [ :class :traits | class addTraits: (traits collect: [ :t | classDict at: t ]) ].

	" Fill in oppositelinks"
	oppositeDict keysAndValuesDo: [ :prop :oppName | prop opposite: (prop type propertyNamed: oppName) ]
]

{ #category : #running }
FMPragmaProcessor >> run [
	queue do: [ :cls | self processClass: cls ].
	self resolveObjectReferences.
	self class shouldValidateMetaModel ifTrue: [ FMMetamodelValidator for: self ]
]
