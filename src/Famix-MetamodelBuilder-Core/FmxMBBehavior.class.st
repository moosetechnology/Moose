"
FamixMetamodelBuilderBehavior
"
Class {
	#name : #FmxMBBehavior,
	#superclass : #FmxMBEntity,
	#traits : 'FmxMBRelationSideTrait + FmxMBInheritableTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait + FmxMBInheritableTrait classTrait',
	#instVars : [
		'relations',
		'realClass',
		'properties',
		'tag',
		'prefix',
		'packageName',
		'testingSelectors',
		'isRoot',
		'traitGeneralizations'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBBehavior >> addRelation: aRelation with: anotherClass [

	self relations add: aRelation.
	anotherClass relations add: aRelation oppositeRelation
	
	
]

{ #category : #accessing }
FmxMBBehavior >> addRelationSide: aRelationSide [

	"skip duplicities"
	(self sides anySatisfy: [ :each | each  name = aRelationSide name ])
		ifTrue: [ ^ self ].

	self sides add: aRelationSide
]

{ #category : #accessing }
FmxMBBehavior >> addTraitGeneralization: aTrait [

	(self traitGeneralizations includes: aTrait)
		ifFalse: [ self traitGeneralizations add: aTrait ].
		
	^ aTrait
]

{ #category : #converting }
FmxMBBehavior >> as: aTraitOrTraitName property: propertyName comment: aString [

	^ (self as: aTraitOrTraitName property: propertyName)
		comment: aString;
		yourself.
]

{ #category : #converting }
FmxMBBehavior >> asRelationSideNamed: aPropertyName [

	^ self property: aPropertyName
]

{ #category : #testing }
FmxMBBehavior >> canProvidePrimaryContainer [

	^ additionalProperties at: #providesPrimaryContainer ifAbsent: [ true ]
]

{ #category : #'settings - default' }
FmxMBBehavior >> defaultTag [

	^ self builder classTag
]

{ #category : #accessing }
FmxMBBehavior >> fullName [

	^ (self prefix, self name) asSymbol
]

{ #category : #generating }
FmxMBBehavior >> generateAccessors [

	self properties do: [ :each |
		each generateAccessorsIn: self realClass. ]

]

{ #category : #generating }
FmxMBBehavior >> generateAnnotationIn: aRealClass as: aName superclass: aSuperclass [

	| aSuperclassName |
	
	aSuperclassName := aSuperclass  
		ifNotNil: [ aSuperclass name ]
		ifNil: [ 
			(self classGeneralization = self defaultSuperclass) 
				ifTrue: [ self defaultSuperclass name]
				ifFalse: [ self classGeneralization 
					ifNil: [ self defaultSuperclass name ]
					ifNotNil: [ 
						self classGeneralization realClass name ] ] ].

	aRealClass classSide compile: ('annotation

	<MSEClass: #{1} super: #{2}>
	<package: {3}>
	<generated>
	^self' format: { aName. aSuperclassName. self builder safeAnnotationPackageName})
		classified: 'meta'

]

{ #category : #generating }
FmxMBBehavior >> generateContainerMethodsIn: aClass [

	| containerSides |
	
	containerSides := ((self allTraits 
		select: #canProvidePrimaryContainer)
		flatCollect: #sides) 
		select: #isContainer.
	
	containerSides size > 1 ifTrue: [ self error: aClass name, 'defines more than one primary container: ', ((containerSides collect: #name) sorted joinUsing: ', ') ].
	
	containerSides do: [ :aSide | aSide generateExtendedContainerMethodsIn: aClass ].
	
	
]

{ #category : #generating }
FmxMBBehavior >> generateNavigationGroups [

	| allNavigationGroups |
	
	allNavigationGroups := self navigationGroups, (self relations flatCollect: [ :relation |
		relation side navigationGroups ]).

	allNavigationGroups do: [ :aGroup |
		| sideName |
		sideName := aGroup entity name.
		
		aGroup entity isMany ifTrue: [ 
			self realClass instanceSide compile: ('{1}

	<generated>
	<navigation: ''{2}''>
	^ MooseGroup
			withAll: (self {3} asSet)' format: { 
				sideName, 'Group'.
				sideName capitalized.
				sideName }) 
			classified: #navigation.]
		ifFalse: [ 
			self realClass instanceSide compile: ('{1}

	<generated>
	<navigation: ''{2}''>
	^ MooseGroup
			with: (self {3})' format: { 
				sideName, 'Group'.
				sideName capitalized.
				sideName }) 
			classified: #navigation.]

	].

]

{ #category : #generating }
FmxMBBehavior >> generateRootMetamodelMethodIn: aClass [ 

	self isRoot ifFalse: [ 
		^ self ].

	aClass classSide compile: ('metamodel

	<generated>
	^ (self class environment at: #{1}) metamodel' 
		format: {self builder generator class name})
		classified: 'meta' 
]

{ #category : #generating }
FmxMBBehavior >> generateTestingMethodsIn: aClass [

	self testingSelectors do: [ :aSelector |
		aClass instanceSide compile: ('{1}\\	<generated>\	^ true' withCRs format: { aSelector }) 
		classified: #testing. ]


]

{ #category : #testing }
FmxMBBehavior >> hasPrimaryContainer [

	^ additionalProperties at: #providesPrimaryContainer ifAbsent: [ false ]
]

{ #category : #accessing }
FmxMBBehavior >> initialize [

	super initialize.
	relations := OrderedCollection new.
	properties := OrderedCollection new.
	prefix := String new.
	packageName := String new.
	testingSelectors := Set new.
	isRoot := true.
]

{ #category : #testing }
FmxMBBehavior >> isMetamodelClass [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isMetamodelTrait [

	^ false
]

{ #category : #testing }
FmxMBBehavior >> isRoot [

	^ false
]

{ #category : #accessing }
FmxMBBehavior >> name [
	^ name
]

{ #category : #accessing }
FmxMBBehavior >> name: anObject [
	name := anObject
]

{ #category : #private }
FmxMBBehavior >> ownerPropertyName [

	^ self name uncapitalized, 'Owner'.
	
]

{ #category : #accessing }
FmxMBBehavior >> packageName [
	^ packageName
]

{ #category : #accessing }
FmxMBBehavior >> packageName: anObject [
	packageName := anObject
]

{ #category : #private }
FmxMBBehavior >> pluralPropertyName [

	| uncapitalized |
	
	uncapitalized := self name uncapitalized.
	
	^ (uncapitalized endsWith: 's')
		ifFalse: [ uncapitalized, 's' ]
		ifTrue: [ uncapitalized, 'es' ]
]

{ #category : #accessing }
FmxMBBehavior >> pluralRelationName [
	
	| lowercase |
	
	lowercase := self name asLowercase.

	^ (lowercase endsWith: 's')
		ifFalse: [ lowercase, 's' ]
		ifTrue: [ lowercase, 'es' ]
]

{ #category : #accessing }
FmxMBBehavior >> prefix [
	^ prefix
]

{ #category : #accessing }
FmxMBBehavior >> prefix: anObject [
	prefix := anObject
]

{ #category : #generating }
FmxMBBehavior >> printOn: aStream [

	<ignoreForCoverage>

	aStream 
		nextPutAll: self class name; 
		nextPutAll: '(';
		nextPutAll: self name asString;
		nextPutAll: ')'
]

{ #category : #accessing }
FmxMBBehavior >> properties [
	^ properties
]

{ #category : #generating }
FmxMBBehavior >> property: propertyName [

	| aSide |

	self assert: propertyName isString.
	
	aSide := FmxMBRelationSide new
		builder: self builder;
		relatedClass: self;
		name: propertyName;
		yourself.
		
	self addRelationSide: aSide.
	^ aSide.
]

{ #category : #accessing }
FmxMBBehavior >> property: propertyName type: aTypeName [

	| aSide |
	
	aSide := FmxMBTypedProperty new
		name: propertyName;
		builder: self builder;
		propertyType: aTypeName asSymbol;
		yourself.
		
	self properties add: aSide.

	^ aSide.		
]

{ #category : #private }
FmxMBBehavior >> propertyName [
	
	^ self name uncapitalized.
	
	
]

{ #category : #accessing }
FmxMBBehavior >> realClass [

	^ realClass ifNil: [ Smalltalk at: self fullName  ]
]

{ #category : #accessing }
FmxMBBehavior >> realClass: anObject [
	realClass := anObject
]

{ #category : #accessing }
FmxMBBehavior >> relatedEntityName [

	^ self name
]

{ #category : #accessing }
FmxMBBehavior >> relations [
	^ relations
]

{ #category : #accessing }
FmxMBBehavior >> sides [
	^ self properties
]

{ #category : #'name conversion' }
FmxMBBehavior >> singularPropertyName [

	| normalizedName uncapitalized |
	
	normalizedName := ((self name size >= 2) 
		and: [ ((self name first:2) allSatisfy: #isUppercase)
		and: [ self name beginsWith: 'T' ] ])
			ifTrue: [ self name withoutPrefix: 'T' ]
			ifFalse: [ self name ].	
	
	uncapitalized := normalizedName uncapitalized.
	
	^ uncapitalized

]

{ #category : #generating }
FmxMBBehavior >> slotDefinitions [

	| slotGroups |
	
	slotGroups := (self properties collect: [ :property | property asSlot ]) groupedBy: #name.

	"check that all slots with the same name have the same properties"
	slotGroups valuesDo: [ :similarSlots |
		self assert: (similarSlots collect: #name) asSet size = 1. ].
		
	^ slotGroups values collect: [ :each | each anyOne ].

]

{ #category : #accessing }
FmxMBBehavior >> subject [

	^ self
]

{ #category : #accessing }
FmxMBBehavior >> tag [
	^ tag ifNil: [ self defaultTag ]
]

{ #category : #accessing }
FmxMBBehavior >> tag: aSymbol [

	tag := aSymbol
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelector: aSelector [

	testingSelectors add: aSelector.
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelectors [

	^ testingSelectors
]

{ #category : #'testing selectors' }
FmxMBBehavior >> testingSelectors: aCollection [

	testingSelectors := aCollection
]

{ #category : #accessing }
FmxMBBehavior >> traitGeneralizations [

	^ traitGeneralizations ifNil: [ traitGeneralizations := OrderedCollection new ]
]

{ #category : #accessing }
FmxMBBehavior >> traitNamesFromGeneralizations [

	^ (self traitGeneralizations collect: #fullName) sorted
]

{ #category : #accessing }
FmxMBBehavior >> uses: aTrait [

	^ self generalization: aTrait
]

{ #category : #accessing }
FmxMBBehavior >> usesWithoutPrimaryContainer: aTrait [

	| traitEntity |
	
	traitEntity := self generalization: aTrait.
	traitEntity additionalProperties at: #providesPrimaryContainer put: false.
	^ traitEntity
]

{ #category : #'testing selectors' }
FmxMBBehavior >> withTesting [

	"adds methods like #isMethod based on the behavior name"

	| aName |
	
	aName := self name capitalized.
	
	"remove T (for traits)"
	((aName size >= 2) and: [( aName first = $T ) and: [ aName second isUppercase ]])
		ifTrue: [ aName := aName allButFirst ].
		
	testingSelectors add: 'is', aName.
]
