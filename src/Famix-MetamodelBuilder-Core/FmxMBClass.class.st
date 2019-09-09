"
FamixMetamodelBuilderClass
"
Class {
	#name : #FmxMBClass,
	#superclass : #FmxMBBehavior,
	#instVars : [
		'classGeneralization',
		'requirements',
		'isHierarchyRoot'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBClass >> acceptVisitor: aVisitor [
	
	<ignoreForCoverage>
	^ aVisitor visitClass: self.
]

{ #category : #accessing }
FmxMBClass >> allClassGeneralizations [

	| result c g|
	result := OrderedCollection new.
	c := self.
	[ g := c classGeneralization. g notNil ] whileTrue: [ 
		result add: g.
		c := g ].
	^ result

]

{ #category : #accessing }
FmxMBClass >> allLocalTraits [
	^ self traitsFromRelations , super allLocalTraits
]

{ #category : #accessing }
FmxMBClass >> allRequirementNames [ 

	^ (self requirements asSet collect: #fullName) sorted
]

{ #category : #accessing }
FmxMBClass >> allTraitNames [ 
	
	^ (self allTraits collect: #fullName) sorted
]

{ #category : #accessing }
FmxMBClass >> allTraits [
	
	| selectedTraits allTraits |
	
	selectedTraits := self allLocalTraits.
	allTraits := self allTraitsInHierarchy.
	
	selectedTraits addAll: ((self glueingTraitsOf: selectedTraits whenAllHierarchyHas: allTraits) copyWithoutAll: allTraits).
	selectedTraits addAll: ((self conditionalGlueingTraitsFor: self) copyWithoutAll: allTraits).
	
	^ selectedTraits asSet
]

{ #category : #accessing }
FmxMBClass >> allTraitsInHierarchy [

	^ ((self allClassGeneralizations copyWith: self) flatCollect: [ :each | each allLocalTraits ]) asSet
]

{ #category : #converting }
FmxMBClass >> as: aTraitOrTraitName [

	| trait |
	
	trait := aTraitOrTraitName isString
		ifTrue: [ self builder ensureLocalTraitNamed: aTraitOrTraitName ]
		ifFalse: [ aTraitOrTraitName ].
	self addTraitGeneralization: trait. 
	
	^ FmxMBClassAlias new
		subject: self;
		trait: trait;
		yourself.
		
	
]

{ #category : #converting }
FmxMBClass >> as: aTraitOrTraitName property: propertyName [

	| aSide aTrait aTraitName |
	
	self assert: propertyName isString.
	
	aTrait := aTraitOrTraitName isString
		ifTrue: [ 
			aTraitName := aTraitOrTraitName.
			self builder ensureLocalTraitNamed: aTraitOrTraitName ]
		ifFalse: [ 
			aTraitName := aTraitOrTraitName name.
			aTraitOrTraitName ].
	
	aSide := FmxMBRelationSide new
		builder: self builder;
		relatedClass: self;
		traitName: aTraitName;
		name: propertyName;
		yourself.

	aTrait addRelationSide: aSide.
	self addTraitGeneralization: aTrait.
	^ aSide.		
]

{ #category : #converting }
FmxMBClass >> asExisting: aTraitOrTraitName [

	| trait |
	
	trait := aTraitOrTraitName isString
		ifTrue: [ self builder ensureTraitNamed: aTraitOrTraitName ]
		ifFalse: [ aTraitOrTraitName ].
	self addTraitGeneralization: trait. 
	
	^ FmxMBClassAlias new
		subject: self;
		trait: trait;
		yourself.
		
	
]

{ #category : #accessing }
FmxMBClass >> classGeneralization [
	^ classGeneralization
]

{ #category : #accessing }
FmxMBClass >> classGeneralization: anObject [
	
	classGeneralization := anObject.
	^ anObject
]

{ #category : #accessing }
FmxMBClass >> conditionalGlueingTraitsFor: aClass [
	^ self builder traitsWithSubBuildersTraits select: [ :each | each canGlueTo: aClass ]
]

{ #category : #accessing }
FmxMBClass >> containerProperties [

	^ ((self properties) select: #isContainer),
	((self traitGeneralizations flatCollect: #properties) select: #isContainer)
]

{ #category : #accessing }
FmxMBClass >> directlyUses: aTrait [

	self = aTrait ifTrue: [ ^ true ].

	^ self allLocalTraits includes: aTrait
]

{ #category : #generating }
FmxMBClass >> generate [

	| aClass aSuperclass aClassName |
	
	self willGenerate ifFalse: [ ^ self ].
	
	aClassName := self fullName.
	
	isHierarchyRoot := self classGeneralization isNil.
	
	aSuperclass := 	isHierarchyRoot 
		ifTrue: [ self defaultSuperclass ]
		ifFalse: [ self classGeneralization realClass ].
	
	aClass := self builder environment createClassNamed: aClassName asSymbol superclass: aSuperclass traitNames: self allTraitNames slots: self slotDefinitions in: self packageName overwrite: true.
	
	aClass tagWith: self tag.
	self builder environment setComment: self comment for: aClass.
			
	self realClass: aClass.
	
	self generateAccessors.
	self generateAnnotationIn: aClass as: self name superclass: nil.
	
	self generateTestingMethodsIn: aClass.
	self generateContainerMethodsIn: aClass.
	self generateRootMetamodelMethodIn: aClass. 	

	self generateRequirementsFor: aClass.

	self generateMethodsMadeByTraitsFor: aClass.
	self generateMethodsToRemoveFromTraitCompositionFor: aClass.
	
	self generateNavigationGroupsFor: aClass.
	self generateAddToCollectionFor: aClass
]

{ #category : #generating }
FmxMBClass >> generateContainerMethodsIn: aClass [
	| primaryContainerProperties |
	primaryContainerProperties := self primaryContainerProperties.

	primaryContainerProperties size > 1 ifTrue: [ self error: aClass name , ' defines more than one primary container: ' , ((primaryContainerProperties collect: #name) sorted joinUsing: ', ') ].

	primaryContainerProperties do: [ :aSide | aSide generateExtendedContainerMethodsIn: aClass ]
]

{ #category : #generating }
FmxMBClass >> generateMethodsMadeByTraitsFor: aClass [

	self allTraits do: [ :aTrait | 
		(aTrait realClass notNil and: [ aTrait realClass class canUnderstand: #generateMethodsFor:in:])
			ifTrue: [ aTrait realClass generateMethodsFor: self in: aClass ]]
]

{ #category : #generating }
FmxMBClass >> generateRemotes [

	| aClass aClassName |
	
	
	aClassName := self fullName.
	
	aClass := self class environment at: aClassName asSymbol ifAbsent: [ self builder environment classNamed: aClassName asSymbol ].
	
	self realClass: aClass.
	
	self generateRemoteAccessors.
	
	
	

]

{ #category : #generating }
FmxMBClass >> generateRequirementsFor: aClass [
	self allRequirementNames
		ifNotEmpty: [ :requirementNames | 
			aClass classSide
				compile:
					('requirements

	<generated>
	^ \{ {1} \}' format: {(requirementNames joinUsing: '. ')})
				classified: #meta ]
]

{ #category : #accessing }
FmxMBClass >> generateTestingMethodsIn: aClass [
	self isRoot
		ifTrue: [ builder testingSelectorsMapping
				keysAndValuesDo: [ :concernedClass :selectors | 
					"In case a testing selector is relatif to a Trait that is not used in the current MM, then we do not need to generate the testing selector."
					(concernedClass isMetamodelTrait and: [ builder classes noneSatisfy: [ :class | class allTransitiveTraits includes: concernedClass ] ])
						ifFalse: [ selectors
								do: [ :sel | 
									| selectorsFromTraits |
									selectorsFromTraits := self traitGeneralizations flatCollect: #testingSelectors.
									(selectorsFromTraits includes: sel) ifFalse: [ aClass instanceSide compile: ('{1}\\	<generated>\	^ false' withCRs format: {sel}) classified: #testing ] ] ] ] ].

	super generateTestingMethodsIn: aClass
]

{ #category : #accessing }
FmxMBClass >> glueingTraitsOf: selectedTraits whenAllHierarchyHas: allTraitsInHierarchy [
	^ self builder traitsWithSubBuildersTraits select: [ :each | (each gluesSomeOf: allTraitsInHierarchy) and: [ each gluesOneOf: selectedTraits ] ]
]

{ #category : #testing }
FmxMBClass >> hasTraitGeneralization: aTrait [

	^ self traitGeneralizations includes: aTrait 
]

{ #category : #initialization }
FmxMBClass >> initialize [

	super initialize.
	
	requirements := Set new.
]

{ #category : #testing }
FmxMBClass >> isContainerOfClassThatUses: aTrait [

	| directUsers containerProperties |
	
	directUsers := self builder classesThatUse: aTrait.
	containerProperties := directUsers flatCollect: #containerProperties.
	^ ((containerProperties collect: [ :side | side otherSide relatedClass ]) select: #notNil)
		anySatisfy: [ :t | self directlyUses: t ] 
		
]

{ #category : #testing }
FmxMBClass >> isMetamodelClass [

	^ true
]

{ #category : #testing }
FmxMBClass >> isRoot [

	^ self classGeneralization isNil
]

{ #category : #generating }
FmxMBClass >> primaryContainerProperties [
	| primaryContainers |
	primaryContainers := ((self allTraits copyWithoutAll: self usedTraitsWithoutPrimaryContainers) flatCollect: #sides) select: [:side | side isContainer and: [ side providesPrimaryContainer ] ].

	primaryContainers addAll: ((self properties select: #isContainer) select: #providesPrimaryContainer).

	^ primaryContainers
]

{ #category : #'name conversion' }
FmxMBClass >> relatedOwnerTraitName [

	^ 'TWith', self pluralPropertyName capitalized
]

{ #category : #'name conversion' }
FmxMBClass >> relatedTraitName [

	^ 'T', self name
]

{ #category : #accessing }
FmxMBClass >> requirements [

	^ requirements 
]

{ #category : #accessing }
FmxMBClass >> requires: collectionOfClasses [

	requirements addAll: collectionOfClasses
]

{ #category : #generating }
FmxMBClass >> subclassOf: aClass [
	
	self generalization: aClass
]

{ #category : #accessing }
FmxMBClass >> traitsFromRelations [

	"returns traits defined by relations"

	^ ((self relations select: [:each | each side trait notNil ])
		collect: [ :each | each side trait]) asSet
]

{ #category : #testing }
FmxMBClass >> usesOnlyTrait: aTrait [

 	^ (self traitGeneralizations size = 1) 
		and: [ self traitGeneralizations first = aTrait ]	
]
