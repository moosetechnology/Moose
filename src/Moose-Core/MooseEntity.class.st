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
	#classInstVars : [
		'cache'
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
MooseEntity class >> cache [
	^ cache ifNil: [ cache := Dictionary new ]
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

{ #category : #testing }
MooseEntity class >> isOfType: aClassFAMIX [
	^ self superclassesAndFamixTraits includes: aClassFAMIX
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

{ #category : #initialization }
MooseEntity class >> resetMooseEntityCache [
	cache := nil
]

{ #category : #testing }
MooseEntity class >> superclassesAndFamixTraits [
	^ self cache at: #superclassesAndFamixTraits ifAbsentPut: [ self usedStatefulTraits , self withAllSuperclasses ]
]

{ #category : #'stateful traits' }
MooseEntity class >> usedStatefulTraits [
	^ self cache at: #usedStatefulTraits ifAbsentPut: [ super usedStatefulTraits ]
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
MooseEntity >> isOfType: aClassFAMIX [
	^ self class isOfType: aClassFAMIX
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
