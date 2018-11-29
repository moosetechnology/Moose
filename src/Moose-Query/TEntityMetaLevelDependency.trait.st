"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of named entities at meta level.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TEntityMetaLevelDependency,
	#category : #'Moose-Query'
}

{ #category : #new }
TEntityMetaLevelDependency classSide >> allChildrenTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allChildrenTypes for: self ifAbsentPut: [ self privateAllChildrenTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allIncomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allIncomingAssociationTypes for: self ifAbsentPut: [ self privateAllIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allOutgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allOutgoingAssociationTypes for: self ifAbsentPut: [ self privateAllOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allParentTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #allParentTypes for: self ifAbsentPut: [ self privateAllParentTypesIn: aMetamodel ]
	
]

{ #category : #meta }
TEntityMetaLevelDependency classSide >> annotation [

	<MSEClass: #TEntityMetaLevelDependency super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenSelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #childrenSelectors for: self ifAbsentPut: [ self privateChildrenSelectorsIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #childrenTypes for: self ifAbsentPut: [ self privateChildrenTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> dependencyFM3PropertyDescriptionIn: aMetamodel [

	aMetamodel ifNil: [ ^ OrderedCollection new ].
	^ (self allDeclaredPropertiesIn: aMetamodel)
		select: [ :e | e hasOpposite and: [ e opposite isSource or: [ e opposite isTarget ] ] ]
]

{ #category : #generator }
TEntityMetaLevelDependency classSide >> generatedSlotNames [
	<generated>
	'TEntityMetaLevelDependency class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
TEntityMetaLevelDependency classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #incomingAssociationTypes for: self ifAbsentPut: [ self privateIncomingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingMSEPropertiesIn: aMetamodel [

	^ aMetamodel additionalProperty: #incomingMSEProperties for: self ifAbsentPut: [ self privateIncomingMSEPropertiesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingAssociationTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingAssociationTypes for: self ifAbsentPut: [ self privateOutgoingAssociationTypesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingMSEPropertiesIn: aMetamodel [

	^ aMetamodel additionalProperty: #outgoingMSEProperties for: self ifAbsentPut: [ self privateOutgoingMSEPropertiesIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> parentSelectorsIn: aMetamodel [

	^ aMetamodel additionalProperty: #parentSelectors for: self ifAbsentPut: [ self privateParentSelectorsIn: aMetamodel ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> parentTypesIn: aMetamodel [

	^ aMetamodel additionalProperty: #parentTypes for: self ifAbsentPut: [ self privateParentTypesIn: aMetamodel ]
	
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateAllChildrenTypesIn: aMetamodel [

	^ ((self childrenTypesIn: aMetamodel) withDeepCollect: [ :each | each childrenTypesInMetamodel: aMetamodel] as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllIncomingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each incomingAssociationTypesIn: aMetamodel])
       addAll: (self incomingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllOutgoingAssociationTypesIn: aMetamodel [
   ^ (((self allChildrenTypesIn: aMetamodel) flatCollectAsSet: [:each | each implementingClassesIn: aMetamodel ])
		flatCollectAsSet: [ :each | each outgoingAssociationTypesIn: aMetamodel])
       addAll: (self outgoingAssociationTypesIn: aMetamodel);
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllParentTypesIn: aMetamodel [
	^ ((self parentTypesIn: aMetamodel) withDeepCollect: [ :each | each parentTypesIn: aMetamodel] as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateChildrenSelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isChildrenProperty thenCollect: #implementingSelector
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateChildrenTypesIn: aMetamodel [
	^ (((self allDeclaredPropertiesIn: aMetamodel) select: [ :fm3Prop | fm3Prop isChildrenProperty ])
		collectAsSet: [ :prop | prop type implementingClass ]) asArray
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateIncomingAssociationTypesIn: aMetamodel [
	^ (self incomingMSEPropertiesIn: aMetamodel) collect: [ :d | d type implementingClass ]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateIncomingMSEPropertiesIn: aMetamodel [
	^ (self dependencyFM3PropertyDescriptionIn: aMetamodel) select: [ :p | p opposite isTarget ]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateOutgoingAssociationTypesIn: aMetamodel [
	^ (self outgoingMSEPropertiesIn: aMetamodel) collect: [ :d | d type implementingClass ]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateOutgoingMSEPropertiesIn: aMetamodel [
	^ (self dependencyFM3PropertyDescriptionIn: aMetamodel) select: [ :p | p opposite isSource ]
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateParentSelectorsIn: aMetamodel [
	^ (self allDeclaredPropertiesIn: aMetamodel) select: #isContainer thenCollect: #implementingSelector
]

{ #category : #new }
TEntityMetaLevelDependency classSide >> privateParentTypesIn: aMetamodel [

	| containerBehaviors metamodelClasses containerUsers |
	
	containerBehaviors := self mooseDescription allAttributes select: #isContainer thenCollect: [:prop | prop type implementingClass].
	
	metamodelClasses := aMetamodel classes reject: [ :e | e implementingClass isTrait ].
	
	containerUsers := metamodelClasses select: [ :e | 
		containerBehaviors anySatisfy: [ :t | e implementingClass usesMooseTraitDirectly: t ] ].
	
	^ (containerBehaviors, (containerUsers collect: #implementingClass) ) asSet asArray
	

	
]

{ #category : #'Moose-Query-Extensions' }
TEntityMetaLevelDependency classSide >> resetTEntityMetaLevelDependencyCaches [

	
]

{ #category : #private }
TEntityMetaLevelDependency >> addAllChildrenIn: aCollection [
	aCollection addAll: self children.
	self children do: [ :each | each addAllChildrenIn: aCollection ].
	^ aCollection
]

{ #category : #private }
TEntityMetaLevelDependency >> addAllParentsIn: aCollection [
	aCollection addAll: self parents.
	self parents do: [ :each | each addAllParentsIn: aCollection ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels."

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self allAtScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX in: aCollection [
	| selectors |
	(self isOfType: aClassFAMIX) ifTrue: [ aCollection add: self ].	
	
	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allAtScope: aClassFAMIX in: aCollection ].
	
	^ aCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allChildren [
	"Returns all the children and sub-children of an entity, i.e my children and those of my children, and those of the children of my children, etc"

	^ self addAllChildrenIn: OrderedCollection new
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allChildrenTypes [
	^ self class allChildrenTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allClients [
	^ self allClientsAtScope: self class
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allClientsAtScope: aClass [
	^ (self queryIncomingDependencies atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]) withoutSelfLoops
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allIncomingAssociationTypes [

	^ self class allIncomingAssociationTypesIn: self metamodel 
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allOutgoingAssociationTypes [
	^ self class allOutgoingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParentTypes [
	^ self class allParentTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParents [
	"Returns all the parents and sup-parents of an entity, i.e my parents and those of my parents, and those of the parents of my parents, etc"

	^ self addAllParentsIn: OrderedCollection new
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allProviders [
	^ self allProvidersAtScope: self class
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allProvidersAtScope: aClass [
	^ (self queryOutgoingDependencies atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]) withoutSelfLoops
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels."

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self allToScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX in: aCollection [
	| selectors |
	(self isOfType: aClassFAMIX) ifTrue: [ aCollection add: self ].	
		
	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allToScope: aClassFAMIX in: aCollection ].
	
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels."

	^ (self allWithScope: aClassFAMIX in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX in: aCollection [

	(self class traits includes: aClassFAMIX) ifTrue: [ self allToScope: aClassFAMIX in: aCollection  ].

	self allParentTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX inheritsFrom: class ] ] ifFound: [ self allAtScope: aClassFAMIX in: aCollection ].
	self allChildrenTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX inheritsFrom: class ] ] ifFound: [ self allToScope: aClassFAMIX in: aCollection ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atScope: aClassFAMIX [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self atScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> atScope: aClassFAMIX in: aCollection [
	(self isOfType: aClassFAMIX)
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) atScope: aClassFAMIX in: aCollection ] ].
	^ aCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency >> children [
	| res |
	res := OrderedCollection new.
	self childrenSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res asSet
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenSelectors [
	^ self class childrenSelectorsIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenTypes [

	^ self metamodel additionalProperty: #childrenTypes for: self class ifAbsentPut: [ self privateChildrenTypes ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> dependencyFM3PropertyDescription [
	^ self class dependencyFM3PropertyDescriptionIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingAssociationTypes [
	^ self class incomingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingMSEProperties [
	^ self class incomingMSEPropertiesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingAssociationTypes [
	^ self class outgoingAssociationTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingMSEProperties [
	^ self class outgoingMSEPropertiesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentSelectors [
	^ self class parentSelectorsIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentTypes [
	^ self class parentTypesIn: self metamodel
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parents [
	| res |
	res := OrderedCollection new.
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res asSet
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self toScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> toScope: aClassFAMIX in: aCollection [
	(self isOfType: aClassFAMIX)
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) toScope: aClassFAMIX in: aCollection ] ].
	^ aCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency >> withAllChildren [
	"I return a collection including me and all my children in the containement tree."

	^ (self allChildren , {self}) asArray
]

{ #category : #accessing }
TEntityMetaLevelDependency >> withAllParents [
	"I return a collection including me and all my parents in the containement tree."

	^ (self allParents , {self}) asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel"

	^ (self withScope: aClassFAMIX in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> withScope: aClassFAMIX in: aCollection [

	((self class traits includes: aClassFAMIX) 
		or: [(self class = aClassFAMIX)]) ifTrue: [ self atScope: aClassFAMIX in: aCollection  ].

	self allParentTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX mooseInheritsFrom: class ] ] ifFound: [ self atScope: aClassFAMIX in: aCollection ].
	self allChildrenTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX mooseInheritsFrom: class ] ] ifFound: [ self toScope: aClassFAMIX in: aCollection ].
	^ aCollection
]
