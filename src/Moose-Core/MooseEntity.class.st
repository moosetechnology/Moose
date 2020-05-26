"
I am an abstract class to define the basic behavior of every entities of a metamodel. All entities except the model and groups of a meta model should inherits from me.
Any moose entity should answer its mooseID, its mooseName and its mooseModel.


!!Meta descriptions

Entities should also be meta-described in terms of Fame. This is achieved by means of pragmas:

- First, on the class side, you should have a method . For example, YourEntity could have
YourEntity class>>annotation
	<FMClass: #YourEntity super: #MooseEntity>
	<package: 'YourPackage'>
	<FMComment: 'The YourEntity Smalltalk class has a correspondent YourEntity meta entity in the Fame world'>

- The pragma <FMProperty:type:> must be placed in the getter method to denote a Fame property. For example:
YourEntity>>yourExtendingAttribute
	<MSEProperty: #yourExtendingAttribute type: #YourType>
	<MSEComment: 'This is an attribute extended in a different package'>
	^ self privateState attributeAt: #yourExtendingAttribute
	
	
!!Important API

- mooseModel of an entity is must be an instance of MooseModel. It may be nil if the entity is not part of a model.	
	Each entity belongs to one and only one model, if an entity has not yet been added to a model or if an entity has been removed from a model the mooseModel is undefined, that is it may be nil.
"
Class {
	#name : #MooseEntity,
	#superclass : #MooseObject,
	#instVars : [
		'mooseModel'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseEntity class >> annotation [
	<FMClass: #Entity super: #MooseObject>
	<package: #Moose>
	<abstract>
	
]

{ #category : #accessing }
MooseEntity class >> implementingClassesIn: aMetamodel [

	^ { self }
]

{ #category : #testing }
MooseEntity class >> isAbstract [
	^ self = MooseEntity
]

{ #category : #testing }
MooseEntity class >> isContainerEntityIn: aMetamodel [
	^ aMetamodel
		additionalProperty: #isContainerEntity
		for: self
		ifAbsentPut: [ (self allDeclaredPropertiesIn: aMetamodel) anySatisfy: #isChildrenProperty ]
]

{ #category : #'instance creation' }
MooseEntity class >> model: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		yourself
]

{ #category : #accessing }
MooseEntity class >> requirements [
	| metamodelClasses usedBehaviors |
	metamodelClasses := self metamodel concreteImplementingClasses.

	usedBehaviors := (self allDeclaredPropertiesIn: self metamodel) select: #isContainer thenCollect: [ :p | p opposite implementingClass ].

	^ (usedBehaviors flatCollect: [ :aBehavior |
			aBehavior isTrait
				ifTrue: [ metamodelClasses select: [ :each | each isComposedBy: aBehavior ] ]
				ifFalse: [ {aBehavior} ] ]) asSet
]

{ #category : #'stateful traits' }
MooseEntity class >> usedStatefulTraits [
	^ self cache at: #usedStatefulTraits ifAbsentPut: [ super usedStatefulTraits ]
]

{ #category : #dependencies }
MooseEntity >> addAllChildrenDependenciesThrough: aDirectionStrategy in: aCollection [
	aCollection addAll: (aDirectionStrategy dependenciesAtReceiverScopeOf: self).
	self children do: [ :each | each addAllChildrenDependenciesThrough: aDirectionStrategy in: aCollection ].
	^ aCollection
]

{ #category : #dependencies }
MooseEntity >> allChildrenDependenciesThrough: aDirectionStrategy [
	^ self addAllChildrenDependenciesThrough: aDirectionStrategy in: OrderedCollection new
]

{ #category : #dependencies }
MooseEntity >> allClientsIn: aMooseGroup [
	"Detect all the clients who are present in the Moose group. 
	For example, if I have a method as client that is not present in this group, but its parent class is present, I'll select it. But in case the method is present, I'll select the method.
	This is useful when creating visualizations in order to select the dependencies within the entities present in the visualization."

	^ self allClientsIn: aMooseGroup forModel: self mooseModel
]

{ #category : #dependencies }
MooseEntity >> allClientsIn: aMooseGroup forModel: aMooseModel [
	"Detect all the clients who are present in the Moose group for a given model (this is useful when using tags).
	For example, if I have a method as client that is not present in this group, but its parent class is present, I'll select it. But in case the method is present, I'll select the method.
	This is useful when creating visualizations in order to select the dependencies within the entities present in the visualization."

	^ FamixDependenciesDetector computeClientsOf: self from: aMooseGroup in: aMooseModel
]

{ #category : #dependencies }
MooseEntity >> allProvidersIn: aMooseGroup [
	"Detect all the providers who are present in the Moose group. 
	For example, if I have a method as client that is not present in this group, but its parent class is present, I'll select it. But in case the method is present, I'll select the method.
	This is useful when creating visualizations in order to select the dependencies within the entities present in the visualization."

	^ self allProvidersIn: aMooseGroup forModel: self mooseModel
]

{ #category : #dependencies }
MooseEntity >> allProvidersIn: aMooseGroup forModel: aMooseModel [
	"Detect all the providers who are present in the Moose group for a given model (this is useful when using tags).
	For example, if I have a method as client that is not present in this group, but its parent class is present, I'll select it. But in case the method is present, I'll select the method.
	This is useful when creating visualizations in order to select the dependencies within the entities present in the visualization."

	^ FamixDependenciesDetector computeProvidersOf: self from: aMooseGroup in: aMooseModel
]

{ #category : #dependencies }
MooseEntity >> detectDependenciesUsing: aDetector [
	| potentialTags |
	potentialTags := aDetector potentialDependencies select: #isTag.
	aDetector
		detectDependenciesFrom: potentialTags;
		removeFromPotentialDependencies: potentialTags;
		detectDependenciesAtAllScopesOfPossibleDependencies
]

{ #category : #properties }
MooseEntity >> handleFameProperty: aSymbol value: anObject [
	
	| value |
	super handleFameProperty: aSymbol value: anObject.
	value := (anObject isCollection and: [anObject size = 1]) ifTrue: [anObject anyOne] ifFalse: [anObject].
	self propertyNamed: aSymbol put: value
]

{ #category : #initialization }
MooseEntity >> initialize [
	super initialize.
	self class initializeSlots: self
]

{ #category : #testing }
MooseEntity >> isContainerEntity [
	^ self class isContainerEntityIn: self metamodel
]

{ #category : #testing }
MooseEntity >> isDead [
	"Only container entities and behaviourals can be dead"

	<MSEProperty: #isDead type: #Boolean>
	<derived>
	<MSEComment: 'Is the entity dead (not invoked in the system)'>
	^ false
]

{ #category : #dependencies }
MooseEntity >> isInListOfPossibleLinks: aCollection forModel: aMooseModel [
	^ aCollection includes: self
]

{ #category : #dependencies }
MooseEntity >> isLinkedTo: anEntity dependancyDirection: aDirectionStrategy in: aMooseModel [
	"find if the specified entities is to linked to this entity at all possible levels in the direction specified by the strategy. All possible levels self, all children and all parents. It is important to see in the all parents because an entity can contain itself"

	| allLinksWithParents |
	allLinksWithParents := self allChildrenDependenciesThrough: aDirectionStrategy.
	allLinksWithParents addAll: (allLinksWithParents flatCollect: #allParents).

	^ anEntity isInListOfPossibleLinks: allLinksWithParents forModel: aMooseModel
]

{ #category : #testing }
MooseEntity >> isRoot [
	"Return true if the entity is not contained in any other entity."

	^ self parents isEmpty
]

{ #category : #testing }
MooseEntity >> isStub [ 
	^ self privateState isStub
]

{ #category : #testing }
MooseEntity >> isStub: aBoolean [ 
	^ self privateState isStub: aBoolean
]

{ #category : #accessing }
MooseEntity >> localMooseModel [
	^ self mooseModel
]

{ #category : #accessing }
MooseEntity >> mooseModel [
	"Answers the model containing the current entity"

	^ mooseModel
]

{ #category : #accessing }
MooseEntity >> mooseModel: aMooseModel [
	aMooseModel add: self.
	self privateSetMooseModel: aMooseModel
]

{ #category : #private }
MooseEntity >> privateSetMooseModel: aMooseModel [
	mooseModel := aMooseModel
]

{ #category : #testing }
MooseEntity >> stub: aBoolean [

	self isStub: aBoolean
]
