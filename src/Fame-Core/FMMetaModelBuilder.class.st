"
Description
--------------------

The most common way to create a meta-model is to have real Pharo classes using pragmas and slots to describe the package, classes and properties of Fame.
I have the responsibility to process those classes and to build a FMMetaModel from those.

I will process slots such has:
- FMMany : This slot allows one to define one side of a relation that will contain multiple elements.
- FMOne : This slot allows on to define one side of a relation that will contain one element.
- Maybe FMProperty in the future

To define the FM3Packages and FM3Class, the class can have a method with those pragmas:
- #FMClass:super: 	Used to define a FM3Class.
- #package: 		Used to define FM3Packages.
- #abstract: 	Used to define that a FM3Class is abstract.
	
To define a property you can use a slot but also a pragma such has:
- #FMProperty:type:opposite: 	Used to define one side of a relation.
- #FMProperty:type: 				Same as above but for relations without opposite.

Once a property is declared via a slot or a pragma, the method related can use other pragma to configure the relation.
- #container 		Used to define that this side of a relation define a container.
- #target 			Used to define that this side of a relation is the target of an association.
- #source 			Used to define that this side of a relation is the source of an association.
- #derived 			Used to define that this side of a relation can be computed and thus flushed.
- #multivalued 		Used to define that this side of a relation contains a collection of objects and not one object.
- #package: 			Used to define that a property is an extension present in the package given as parameter.
			
Once a meta-model is built, I will run a validator on it. If you do not wish for the meta-model to go through the validation (might happen when you prototype your MM), you can disable it calling #withoutValidation.

Public API and Key Messages
--------------------

- #metamodelFrom: 	aCollectionOfClasses 		This class side method takes a collection of classes as parameter and will process them to return a metamodel.
- #metamodelFromPackages: aCollection 		This class side method takes a collection of packages as parameter and will process the classes contained in them to return a metamodel.

Examples
--------------------

	FMMetaModelBuilder metamodelFrom: {RPGDragon . RPGTreasure . RPGHero}.
	
	FMMetaModelBuilder metamodelFromPackages: {'Fame-Core' asPackage}.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	classDict:					<aDictionary>			A dictionary mapping real classes with their generated FM3Class.
	elements:						<aCollection>			A collection of all the fame elements already created.
	implementingPackages:		<aCollection>			A collection containing all the packages to process.
	metaDict:						<aDictionary>			A dictionary mapping fame elements full names to their real fame element.
	mmClassDict:					<aDictionary>			A dictionary mapping properties with their FM3Class.
	oppositeDict:				<aDictionary>			A dictionary mapping properties with the name of their opposite.
	packDict:						<aDictionary>			A dictionary mapping fame packages with all the fame entites they contains.
	queue:							<aCollection>			A collection of all the classes that are yet to be processed.
	superclassDict:				<aDictionary>			A dictionary mapping classes with their superclass.
	traitsDict:					<aDictionary>			A dictionary mapping classes with their trait.
	typeDict:						<aDictionary>			A dictionary mapping properties with their type.
	validator:					<aFMMMValidator>		A validator class to use to validate that the meta-model to be generated is right.
								
	I do not resolve everything while processing the pragmas and slots since the processor does not care about the processing order.
	Instead I am keeping a maximum of information and I do the resolution at the end.
	This is the reason I have so many dictionaries.

"
Class {
	#name : #FMMetaModelBuilder,
	#superclass : #Object,
	#instVars : [
		'elements',
		'classDict',
		'metaDict',
		'superclassDict',
		'typeDict',
		'oppositeDict',
		'mmClassDict',
		'queue',
		'implementingPackages',
		'packDict',
		'traitsDict',
		'validator'
	],
	#classVars : [
		'ShouldValidateMetaModel'
	],
	#category : #'Fame-Core-Utilities'
}

{ #category : #processing }
FMMetaModelBuilder class >> metamodelFrom: aCollectionOfClasses [
	^ self new
		queue: aCollectionOfClasses;
		run;
		asMetamodel
]

{ #category : #processing }
FMMetaModelBuilder class >> metamodelFromPackages: aCollectionOfPackages [
	^ self new
		queue: (aCollectionOfPackages flatCollectAsSet: [ :p | p definedClasses asSet select: #isMetamodelEntity ]);
		implementingPackages: aCollectionOfPackages;
		run;
		asMetamodel
]

{ #category : #converting }
FMMetaModelBuilder >> asMetamodel [
	^ FMMetaModel new
		addAll: elements;
		yourself
]

{ #category : #running }
FMMetaModelBuilder >> buildFM3 [
	self
		queue: (self class package definedClasses asSet select: #isMetamodelEntity);
		run
]

{ #category : #accessing }
FMMetaModelBuilder >> classes [
	^ elements select: #isFM3Class
]

{ #category : #accessing }
FMMetaModelBuilder >> elements [
	^ elements
]

{ #category : #private }
FMMetaModelBuilder >> ensureClass: var [
	var isBehavior ifTrue: [ ^ classDict at: var ].
	var isSymbol ifTrue: [ ^ classDict at: (self class environment at: var) ifAbsent: [ metaDict at: var asString ] ].
	var isString ifTrue: [ ^ metaDict at: var ].
	self error: 'No class of this name found.'
]

{ #category : #private }
FMMetaModelBuilder >> ensurePackage: name [
	self assert: (name isSymbol or: [ name isString ]).
	^ self packages
		detect: [ :package | package name = name asString ]
		ifNone: [
			(FM3Package named: name asString)
				in: [ :pack | elements add: pack ];
				yourself ]
]

{ #category : #private }
FMMetaModelBuilder >> extractPackageFrom: method for: aFM3Element [
	^ (method pragmaAt: #package:) ifNotNil: [ :p | packDict at: aFM3Element put: (p argumentAt: 1) ]
]

{ #category : #running }
FMMetaModelBuilder >> implementingPackages [
	^ implementingPackages ifNil: [ implementingPackages := queue collectAsSet: #package ]
]

{ #category : #running }
FMMetaModelBuilder >> implementingPackages: aColl [
	implementingPackages := aColl
]

{ #category : #initialization }
FMMetaModelBuilder >> initialize [
	"Used for queuing classes before running."

	queue := OrderedCollection new.
	"Used to store resulting FM3 elements."
	elements := OrderedCollection new.
	"Several dictionaries ... see #resolveObjectReference"
	classDict := Dictionary new.
	superclassDict := IdentityDictionary new.
	packDict := IdentityDictionary new.
	typeDict := IdentityDictionary new.
	oppositeDict := IdentityDictionary new.
	mmClassDict := IdentityDictionary new.
	traitsDict := IdentityDictionary new.

	"Must use the cannonical primitives here!"
	"Please do not add these primitives to elements!"
	metaDict := (FM3Constant constants collect: [ :const | const name asString -> const ]) asDictionary
]

{ #category : #private }
FMMetaModelBuilder >> methodsToProcessFrom: aClass [
	"We need to process the methods from the class and the extensions methods comming from the packages containing the entites. We should reject extension methods comming from other packages."

	^ aClass localMethods select: [ :method | method isExtension not or: [ self implementingPackages includes: method package ] ]
]

{ #category : #accessing }
FMMetaModelBuilder >> packages [
	^ elements select: #isFM3Package
]

{ #category : #private }
FMMetaModelBuilder >> processClass: aClass [
	^ self processClass: aClass ifPragmaAbsent: [ self error: 'Fame Undeclared class ' , aClass name ]
]

{ #category : #private }
FMMetaModelBuilder >> processClass: aClass ifPragmaAbsent: anErrorBlock [
	aClass metamodelDefinitionPragma
		ifNil: anErrorBlock
		ifNotNil: [ :pragma | 
			| fm3Class |
			fm3Class := FM3Class named: (pragma argumentAt: 1).
			superclassDict at: fm3Class put: (pragma argumentAt: 2).
			fm3Class implementingClass: aClass.

			(pragma method pragmaAt: #abstract) ifNotNil: [ fm3Class isAbstract: true ].
			self extractPackageFrom: pragma method for: fm3Class.
			classDict at: aClass put: fm3Class.
			(self methodsToProcessFrom: aClass) do: [ :each | self processCompiledMethod: each ].
			aClass localSlots select: #isFMRelationSlot thenDo: [ :each | self processSlot: each in: aClass ].

			traitsDict at: fm3Class put: aClass allGeneratedTraits.

			elements add: fm3Class ]
]

{ #category : #private }
FMMetaModelBuilder >> processCompiledMethod: aMethod [
	| method |
	method := aMethod.

	"If the method is a reflective method we need to ensure it is compiled and use its compiled method.
	A refelctive method is for exemple a method created via a metalink and that was never executed."
	(aMethod isKindOf: ReflectiveMethod)
		ifTrue: [ method := aMethod
				compileAndInstallCompiledMethod;
				compiledMethod ].
	self assert: method isCompiledMethod.

	"29 of October 2019: The MSEProperty:type:(opposite:) pragma is deprecated and should not be used anymore. But we still keep it for some time for backward compatibility."
	method pragmas
		detect: [ :each | #(#MSEProperty:type:opposite: #MSEProperty:type: #FMProperty:type:opposite: #FMProperty:type:) includes: each selector ]
		ifFound: [ :pragma | 
			| prop |
			prop := FM3Property named: (pragma argumentAt: 1) asString.
			typeDict at: prop put: (pragma argumentAt: 2).
			mmClassDict at: prop put: method methodClass.
			(pragma selector = #MSEProperty:type:opposite: or: [ pragma selector = #FMProperty:type:opposite: ])
				ifTrue: [ oppositeDict at: prop put: (pragma argumentAt: 3) ].
			self processInfosFrom: method for: prop.

			elements add: prop ]
]

{ #category : #private }
FMMetaModelBuilder >> processInfosFrom: aMethod for: prop [
	prop implementingSelector: aMethod selector.
	self extractPackageFrom: aMethod for: prop.
	(aMethod pragmaAt: #container) ifNotNil: [ prop isContainer: true ].
	(aMethod pragmaAt: #derived) ifNotNil: [ prop isDerived: true ].
	(aMethod pragmaAt: #source) ifNotNil: [ prop isSource: true ].
	(aMethod pragmaAt: #target) ifNotNil: [ prop isTarget: true ].
	(aMethod pragmaAt: #multivalued) ifNotNil: [ prop isMultivalued: true ]
]

{ #category : #private }
FMMetaModelBuilder >> processSlot: aSlot in: aClass [
	| prop |
	prop := FM3Property named: aSlot name.
	prop implementingSelector: aSlot name.
	prop isMultivalued: aSlot isToMany.

	typeDict at: prop put: aSlot targetClass.
	mmClassDict at: prop put: aClass.
	oppositeDict at: prop put: aSlot inverseName.

	aClass compiledMethodAt: aSlot name asSymbol ifPresent: [ :aMethod | self processInfosFrom: aMethod for: prop ].

	elements add: prop
]

{ #category : #accessing }
FMMetaModelBuilder >> properties [
	^ elements select: #isFM3Property
]

{ #category : #running }
FMMetaModelBuilder >> queue: var [
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
FMMetaModelBuilder >> resolveObjectReferences [

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
FMMetaModelBuilder >> run [
	queue do: [ :cls | self processClass: cls ].
	self resolveObjectReferences.
	self validator for: self
]

{ #category : #accessing }
FMMetaModelBuilder >> validator [
	^ validator ifNil: [ FMMetamodelValidator ]
]

{ #category : #accessing }
FMMetaModelBuilder >> withoutValidation [
	validator := FMNilMetamodelValidator
]
