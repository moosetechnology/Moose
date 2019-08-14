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
	<package: #'Moose-Query'>
	<generated>
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
	containerBehaviors := self mooseDescription allAttributes select: #isContainer thenCollect: [ :prop | prop type implementingClass ].

	metamodelClasses := aMetamodel classes reject: [ :e | e implementingClass isTrait ].

	containerUsers := metamodelClasses select: [ :e | containerBehaviors anySatisfy: [ :t | e implementingClass allGeneratedTraits includes: t ] ].

	^ (containerBehaviors , (containerUsers collect: #implementingClass)) asSet asArray
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
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ (self allAtAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses in: aCollection [
	^ self allAtAnyScope: aCollectionOfFamixClasses in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock [
	| selectors |
	(aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | self isOfType: aFAMIXClass ]) ifTrue: [ aCollection add: self ].
	(rejectBlock value: self)
		ifFalse: [ 1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allAtAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ] ].

	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self allAtAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock ) asSet asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels."

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self allAtScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX in: aCollection [
	^ self allAtScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX in: aCollection until: rejectBlock [
	| selectors |
	(self isOfType: aClassFAMIX) ifTrue: [ aCollection add: self ].

	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allAtScope: aClassFAMIX in: aCollection until: rejectBlock ] ].

	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allAtScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true."

	^ (self allAtScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet asArray
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
	^ self queryIncomingDependencies withoutSelfLoops atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]
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
	^ self queryOutgoingDependencies withoutSelfLoops atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ (self allToAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses in: aCollection [
	^ self allToAnyScope: aCollectionOfFamixClasses in: aCollection until: self falseBlock
]

{ #category : #private }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock [
	| selectors |
	(aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | self isOfType: aFAMIXClass ]) ifTrue: [ aCollection add: self ].

	(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allToAnyScope: aCollectionOfFamixClasses in: aCollection  until: rejectBlock ] ].

	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the encountered entities (recursively) at matching one of the class scope given as parameter that are down in the containment tree of the metamodel
	I stop the recursion when the rejectBlock is true"

	^ (self allToAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock) asSet asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels."

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self allToScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX in: aCollection [
	^ self allToScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX in: aCollection until: rejectBlock [
	| selectors |
	(self isOfType: aClassFAMIX) ifTrue: [ aCollection add: self ].

	"The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
	(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) allToScope: aClassFAMIX in: aCollection until: rejectBlock ] ].

	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allToScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self allToScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel"

	^ (self allWithAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses in: aCollection [
	^ self allWithAnyScope: aCollectionOfFamixClasses in: aCollection until: self falseBlock
]

{ #category : #private }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock [
	(aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | self class traits includes: aFAMIXClass ]) ifTrue: [ self allToAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].

	self allParentTypes
		detect: [ :class | aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | aFAMIXClass = class or: [ aFAMIXClass inheritsFrom: class ] ] ]
		ifFound: [ self allAtAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].
	self allChildrenTypes
		detect: [ :class | aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | aFAMIXClass = class or: [ aFAMIXClass inheritsFrom: class ] ] ]
		ifFound: [ self allToAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the entities (recursively) matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self allWithAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock) asSet
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels."

	^ (self allWithScope: aClassFAMIX in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX in: aCollection [
	^ self allWithScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX in: aCollection until: rejectBlock [

	(self class traits includes: aClassFAMIX) ifTrue: [ self allToScope: aClassFAMIX in: aCollection until: rejectBlock ].

	self allParentTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX inheritsFrom: class ] ] ifFound: [ self allAtScope: aClassFAMIX in: aCollection until: rejectBlock ].
	self allChildrenTypes detect: [ :class | aClassFAMIX = class or: [ aClassFAMIX inheritsFrom: class ] ] ifFound: [ self allToScope: aClassFAMIX in: aCollection until: rejectBlock ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> allWithScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the entities at a given famix class scope that are up or down in the containment tree of the metamodel on multiple levels.
	I stop the recursion when the rejectBlock is true"

	^ (self allWithScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel"

	^ (self atAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixScopes in: aCollection [
	^ self atAnyScope: aCollectionOfFamixScopes in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixScopes in: aCollection until: rejectBlock [
	(aCollectionOfFamixScopes anySatisfy: [ :aClassFAMIX | self isOfType: aClassFAMIX ])
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) atAnyScope: aCollectionOfFamixScopes in: aCollection  until: rejectBlock ] ] ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self atAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock) asSet asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atScope: aClassFAMIX [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self atScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> atScope: aClassFAMIX in: aCollection [
	^ self atScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> atScope: aClassFAMIX in: aCollection until: rejectBlock [
	(self isOfType: aClassFAMIX)
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self parentSelectors) size do: [ :ind | (self perform: (selectors at: ind)) atScope: aClassFAMIX in: aCollection  until: rejectBlock ] ] ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> atScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self atScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet asArray
]

{ #category : #accessing }
TEntityMetaLevelDependency >> children [
	| res |
	res := Set new.
	self childrenSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res
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

{ #category : #private }
TEntityMetaLevelDependency >> falseBlock [
	^ [ :a | false ]
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
TEntityMetaLevelDependency >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	^ self isContainerEntity ifTrue: [ self children size ] ifFalse: [ 0 ]
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
	res := Set new.
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel"

	^ (self toAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses in: aCollection [
	^ self toAnyScope: aCollectionOfFamixClasses in: aCollection until: self falseBlock
]

{ #category : #private }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock [
	(aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | self isOfType: aFAMIXClass ])
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) toAnyScope: aCollectionOfFamixClasses in: aCollection  until: rejectBlock ] ] ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope given as parameter that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self toAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock) asSet asArray
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self toScope: aClassFAMIX in: OrderedCollection new) asSet asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> toScope: aClassFAMIX in: aCollection [
	^ self toScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> toScope: aClassFAMIX in: aCollection until: rejectBlock [
	(self isOfType: aClassFAMIX)
		ifTrue: [ aCollection add: self ]
		ifFalse: [ "The content of this block could be much more readable with #do: but we do this solution for performances... We need this method to be really really performant."
			| selectors |
			(rejectBlock value: self) ifFalse: [ 1 to: (selectors := self childrenSelectors) size do: [ :ind | (self perform: (selectors at: ind)) toScope: aClassFAMIX in: aCollection  until: rejectBlock ] ] ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> toScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	self flag: #todo.	"I think we do not need the #asArray cast but it will break tests. I will probably let it now then change the tests later. Step by step."
	^ (self toScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet asArray
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
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel"

	^ (self withAnyScope: aCollectionOfFamixClasses in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses in: aCollection [
	^ self withAnyScope: aCollectionOfFamixClasses in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock [
	(aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | (self class traits includes: aFAMIXClass) or: [ self class = aFAMIXClass ] ])
		ifTrue: [ self atScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].

	self allParentTypes
		detect: [ :class | aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | aFAMIXClass = class or: [ aFAMIXClass mooseInheritsFrom: class ] ] ]
		ifFound: [ self atAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].
	self allChildrenTypes
		detect: [ :class | aCollectionOfFamixClasses anySatisfy: [ :aFAMIXClass | aFAMIXClass = class or: [ aFAMIXClass mooseInheritsFrom: class ] ] ]
		ifFound: [ self toAnyScope: aCollectionOfFamixClasses in: aCollection until: rejectBlock ].
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withAnyScope: aCollectionOfFamixClasses until: rejectBlock [
	"I am used to return all the first encountered entities matching one of the class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self withAnyScope: aCollectionOfFamixClasses in: OrderedCollection new until: rejectBlock) asSet
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withScope: aClassFAMIX [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel"

	^ (self withScope: aClassFAMIX in: OrderedCollection new) asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> withScope: aClassFAMIX in: aCollection [
	^ self withScope: aClassFAMIX in: aCollection until: self falseBlock 
]

{ #category : #private }
TEntityMetaLevelDependency >> withScope: aClassFAMIX in: aCollection until: rejectBlock [
	self atScope: aClassFAMIX in: aCollection until: rejectBlock.
	self toScope: aClassFAMIX in: aCollection until: rejectBlock.
	^ aCollection
]

{ #category : #scoping }
TEntityMetaLevelDependency >> withScope: aClassFAMIX until: rejectBlock [
	"I am used to return all the first encountered  entities at a given famix class scope that are up or down in the containment tree of the metamodel.
	I stop the recursion when the rejectBlock is true"

	^ (self withScope: aClassFAMIX in: OrderedCollection new until: rejectBlock) asSet
]
