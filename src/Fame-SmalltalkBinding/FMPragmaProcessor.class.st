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
		'packMetaDict',
		'typeDict',
		'oppositeDict',
		'packPropDict',
		'mmClassDict',
		'queue'
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

{ #category : #private }
FMPragmaProcessor >> allowPackageNamed: packageName [
	"generic method for subclass specilization"
	^ true
]

{ #category : #converting }
FMPragmaProcessor >> asMetamodel [
	| mm |
	mm := FMMetaRepository
		with: FMMetaRepository fm3.
	mm addAll: elements.
	^ mm
]

{ #category : #converting }
FMPragmaProcessor >> asTower [
	| tower mm |
	mm := self asMetamodel.
	tower := FMCompleteTower new.
	tower metaMetamodel: mm metamodel.
	tower metamodel: mm.
	tower model: (FMRepository with: mm).
	^ tower

	"This creation code might eventually end up in Tower or Repository,
	just let it grow, it will find its proper place over time."
]

{ #category : #running }
FMPragmaProcessor >> buildFM3 [

	self queue: FM3Element.
	self queue: FM3MetaDescription.
	self queue: FM3PackageDescription.
	self queue: FM3PropertyDescription.
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
	var isBehavior
		ifTrue: [ ^ classDict at: var ].
	var isSymbol
		ifTrue: [ ^ classDict
				at: (self class environment at: var)
				ifAbsent: [ metaDict at: var asString ] ].
	var isString
		ifTrue: [ ^ metaDict at: var ].
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
			pack := FM3PackageDescription new.
			pack name: symbol.
			elements add: pack.
			pack ]
]

{ #category : #private }
FMPragmaProcessor >> initialize [
	"Used for queuing classes before running."
	queue := OrderedCollection new.
	"Used to store resulting FM3 elements."
	elements := OrderedCollection new.
	"Several dictionaries ... see #resolveObjectReference"
	packageDict := Dictionary new.
	classDict := Dictionary new.
	superclassDict := IdentityDictionary new.
	packMetaDict := IdentityDictionary new.
	typeDict := IdentityDictionary new.
	oppositeDict := IdentityDictionary new.
	packPropDict := IdentityDictionary new.
	mmClassDict := IdentityDictionary new.
	metaDict := Dictionary new.

	"Must use the cannonical primitives here!"
	"Please do not at these primitives to elements!"
	metaDict 
		at: 'String'
		put: FM3MetaDescription string.
	metaDict 
		at: 'Boolean'
		put: FM3MetaDescription boolean.
	metaDict 
		at: 'Number'
		put: FM3MetaDescription number.
	metaDict 
		at: 'Object'
		put: FM3MetaDescription object
]

{ #category : #accessing }
FMPragmaProcessor >> packages [
	^ elements select: [ :e | e isFM3Package ]
]

{ #category : #private }
FMPragmaProcessor >> processClass: aClass [
	^ self
		processClass: aClass
		ifPragmaAbsent: [ self error: 'Fame Undeclared class ' , aClass name ]
]

{ #category : #private }
FMPragmaProcessor >> processClass: aClass ifPragmaAbsent: anErrorBlock [
	| pragma meta className superclassName |
	pragma := aClass metamodelDefinitionPragmas.
	pragma ifEmpty: anErrorBlock.
	pragma
		ifEmpty: [ className := aClass name.
			superclassName := aClass superclass name ]
		ifNotEmpty: [ className := pragma first argumentAt: 1.
			superclassName := pragma first argumentAt: 2 ].


	"the description for the class"
	meta := FM3MetaDescription new.
	meta name: className asString.
	superclassDict at: meta put: superclassName.
	meta setImplementingClass: aClass.
	pragma
		ifNotEmpty: [ (Pragma inMethod: pragma first method named: #abstract)
				ifNotNil: [ meta isAbstract: true ].
			(Pragma inMethod: pragma first method named: #package:)
				ifNotNil: [ :p | 
					| packageName |
					packageName := p argumentAt: 1.
					(self allowPackageNamed: packageName)
						ifFalse: [ ^ self ].
					packMetaDict at: meta put: packageName asString ] ].
	elements add: meta.
	classDict at: aClass put: meta.
	aClass methods do: [ :each | self processCompiledMethod: each ].
	aClass slots do: [ :each | self processSlot: each in: aClass].
	meta isFM3Class should beTrue.
	^ meta
]

{ #category : #private }
FMPragmaProcessor >> processCompiledMethod: aMethod [
	| pragma prop method |
	method := aMethod.

	"If the method is a reflective method we need to ensure it is compiled and use its compiled method.
	A refelctive method is for exemple a method created via a metalink and that was never executed."
	(aMethod isKindOf: ReflectiveMethod)
		ifTrue: [ aMethod compileAndInstallCompiledMethod.
			method := aMethod compiledMethod ].

	method isCompiledMethod should beTrue.
	pragma := Pragma inMethod: method named: #(#MSEProperty:type:opposite: #MSEProperty:type:).
	pragma ifNil: [ ^ self ].
	prop := FM3PropertyDescription new.
	(Pragma inMethod: method named: #package:)
		ifNotNil: [ :p | 
			| packageName |
			packageName := p argumentAt: 1.
			(self allowPackageNamed: packageName) ifFalse: [ ^ self ].
			packPropDict at: prop put: packageName ].
	"we check the package first because if we do not want to load it,
		we ignore the whole property"
	prop name: (pragma argumentAt: 1) asString.
	typeDict at: prop put: (pragma argumentAt: 2).
	mmClassDict at: prop put: method methodClass.
	prop setImplementingSelector: method selector.
	pragma keyword = #MSEProperty:type:opposite: ifTrue: [ oppositeDict at: prop put: (pragma argumentAt: 3) ].
	(Pragma inMethod: method named: #container) ifNotNil: [ prop isContainer: true ].
	(Pragma inMethod: method named: #derived) ifNotNil: [ prop isDerived: true ].
	(Pragma inMethod: method named: #source) ifNotNil: [ prop isSource: true ].
	(Pragma inMethod: method named: #target) ifNotNil: [ prop isTarget: true ].
	(Pragma inMethod: method named: #multivalued)
		ifNotNil: [ self
				assert: prop isContainer not
				description: 'It is not possible to have <multivalue> and <container> on the same method. container represents a aggregation UML link that is incompatible with the multivalue kind of the link'.
			prop isMultivalued: true ].
	(Pragma inMethod: method named: #key:) ifNotNil: [ :p | prop key: (p argumentAt: 1) ].
	elements add: prop
]

{ #category : #private }
FMPragmaProcessor >> processSlot: aSlot in: aClass [
	| prop |
	
	(aSlot isFMRelationSlot) ifFalse: [
		^ self ].
	
	prop := elements add: aSlot mooseProperty.

	typeDict at: prop put: aSlot targetClass.
	mmClassDict at: prop put: aClass.
	oppositeDict at: prop put: aSlot inverseName.
	
	aClass methodDict at: aSlot name asSymbol ifPresent: [:aMethod | 
		prop setImplementingSelector: aMethod selector.
		(Pragma inMethod: aMethod named: #package:) ifNotNil: [ :p | 
			| packageName |
			packageName := p argumentAt: 1.
			(self allowPackageNamed: packageName)
				ifFalse: [ ^ self ].
			packPropDict at: prop put: packageName ].

		(Pragma inMethod: aMethod named: #container) ifNotNil: [ prop isContainer: true ].
		(Pragma inMethod: aMethod named: #derived) ifNotNil: [ prop isDerived: true ].
		(Pragma inMethod: aMethod named: #source) ifNotNil: [ prop isSource: true ].
		(Pragma inMethod: aMethod named: #target) ifNotNil: [ prop isTarget: true ]. 
		(Pragma inMethod: aMethod named: #multivalued)
			ifNotNil: [ prop isMultivalued: true ].
		(Pragma inMethod: aMethod named: #key:)
			ifNotNil: [ prop key: ((Pragma inMethod: aMethod named: #key:) argumentAt: 1) ] ].
	elements add: prop.
	^ prop.
		
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

	"establish class-package links"
	packMetaDict keysAndValuesDo: [ :meta :value |
		meta package: (self ensurePackage: value)
	].
	"establish property-package links"
	packPropDict keysAndValuesDo: [ :prop :value |
		prop package: (self ensurePackage: value)
	].
	"establish property-class associations"
	mmClassDict keysAndValuesDo: [ :prop :value |
		prop mmClass: (self ensureClass: value)
	].
	"map classes by full name"
	self classes do: [ :meta |
		metaDict at: meta fullName asString put: meta.
	].
	"establish class-superclass associations"
	superclassDict keysAndValuesDo: [ :meta :value |
		meta superclass: (self ensureClass: value).
	].	
	"establish property-type-oppoiste relations"
	typeDict keysAndValuesDo: [ :prop :value |
		prop type: (self ensureClass: value).
	].
	" Fill in oppositelinks"
	oppositeDict keysAndValuesDo: [ :prop :oppName |
		prop opposite: (prop type attributeNamed: oppName)
	]
]

{ #category : #running }
FMPragmaProcessor >> run [
	queue do: [ :cls | self processClass: cls ].
	self resolveObjectReferences.
	self class shouldValidateMetaModel
		ifTrue: [ self validateMetaModel ]
]

{ #category : #private }
FMPragmaProcessor >> validateMetaModel [
	| fullDict wronglySetOpposites |
	"Check that opposite link is bijective, i.e. there are not 2 values that references the same opposite."
	fullDict := OrderedCollection new.
	oppositeDict keysAndValuesDo: [ :prop :oppName | fullDict add: (prop type attributeNamed: oppName) -> prop ].
	wronglySetOpposites := (fullDict groupedBy: #key) select: [ :e | e size ~= 1 ].
"	self assert: wronglySetOpposites isEmpty description: 'Link to opposite links should be a bijective operation... Please check your model!'.
	self
		assert: ((fullDict groupedBy: #key) at: nil ifAbsent: [ #() ]) isEmpty
		description: 'Some opposite links are not definied in your model.. Please check your model!'"
]
