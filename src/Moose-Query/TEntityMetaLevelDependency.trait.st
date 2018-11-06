"
This trait provides a common, paradigm agnostic vocabulary to query dependencies of named entities at meta level.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TEntityMetaLevelDependency,
	#classInstVars : [
		'allChildrenTypes',
		'allParentTypes',
		'allIncomingAssociationTypes',
		'allOutgoingAssociationTypes',
		'outgoingAssociationTypes',
		'childrenSelectors',
		'parentSelectors',
		'incomingAssociationTypes',
		'outgoingMSEProperties',
		'incomingMSEProperties'
	],
	#category : #'Moose-Query'
}

{ #category : #meta }
TEntityMetaLevelDependency classSide >> annotation [

	<MSEClass: #TEntityMetaLevelDependency super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
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
TEntityMetaLevelDependency classSide >> incomingAssociationTypes [
	"Default value"
	"TODO: Clean"
	^ self privateIncomingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingMSEProperties [
	"TODO: Clean"

	^ incomingMSEProperties ifNil: [ incomingMSEProperties := self privateIncomingMSEProperties ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateIncomingAssociationTypes [
	"TODO: Clean"

	^ self incomingMSEProperties collect: [ :d | d type implementingClass ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateIncomingMSEProperties [
	"TODO: Clean"

	^ self dependencyFM3PropertyDescription select: [ :p | p opposite isTarget ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateParentTypes [

	| containerBehaviors metamodelClasses containerUsers |
	"TODO: Clean"

	containerBehaviors := self mooseDescription allAttributes select: #isContainer thenCollect: [:prop | prop type implementingClass].
	
	metamodelClasses := self metamodel classes reject: [ :e | e implementingClass isTrait ].
	
	containerUsers := metamodelClasses select: [ :e | 
		containerBehaviors anySatisfy: [ :t | e implementingClass usesMooseTraitDirectly: t ] ].
	
	^ (containerBehaviors, (containerUsers collect: #implementingClass) ) asSet asArray
	

	
]

{ #category : #'Moose-Query-Extensions' }
TEntityMetaLevelDependency classSide >> resetTEntityMetaLevelDependencyCaches [

	childrenSelectors := parentSelectors := allChildrenTypes := allParentTypes := outgoingMSEProperties := incomingMSEProperties := incomingAssociationTypes := outgoingAssociationTypes := allOutgoingAssociationTypes := allIncomingAssociationTypes := nil
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

	^ self metamodel additionalProperty: #allChildrenTypes for: self class ifAbsentPut: [ self privateAllChildrenTypes ]
	
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

	^ self metamodel additionalProperty: #allIncomingAssociationTypes for: self class ifAbsentPut: [ self privateAllIncomingAssociationTypes ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allOutgoingAssociationTypes [

	^ self metamodel additionalProperty: #allOutgoingAssociationTypes for: self class ifAbsentPut: [ self privateAllOutgoingAssociationTypes ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParentTypes [

	^ self metamodel additionalProperty: #allParentTypes for: self class ifAbsentPut: [ self privateAllParentTypes ]
	
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

	^ self metamodel additionalProperty: #childrenSelectors for: self class ifAbsentPut: [ self privateChildrenSelectors ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenTypes [

	^ self metamodel additionalProperty: #childrenTypes for: self class ifAbsentPut: [ self privateChildrenTypes ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> dependencyFM3PropertyDescription [
	^ self allDeclaredProperties
		select: [ :e | e hasOpposite and: [ e opposite isSource or: [ e opposite isTarget ] ] ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingAssociationTypes [

	^ self metamodel additionalProperty: #incomingAssociationTypes for: self class ifAbsentPut: [ self privateIncomingAssociationTypes ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingMSEProperties [

	^ self metamodel additionalProperty: #incomingMSEProperties for: self class ifAbsentPut: [ self privateIncomingMSEProperties ]
	
]

{ #category : #'moosechef-scoping-filtering' }
TEntityMetaLevelDependency >> moosechefEqualsTo: anEntity moduloScope: aScope [
	"checks whether receiver is equal to anEntity at the given scope.
	  For example, a class could be equal to a method at the packageScope, i.e. they belong to the same package.
	  When changing scopes, we might get collections and then we check whether it includes the receiver"

	| entityRescoped myselfRescoped |
	myselfRescoped := self atScope: aScope.
	(myselfRescoped size = 1) ifTrue: [ myselfRescoped := myselfRescoped anyOne ].
	myselfRescoped isCollection
		ifTrue: [ ^ myselfRescoped anySatisfy: [ :myElt | myElt moosechefEqualsTo: anEntity moduloScope: aScope ] ]
		ifFalse: [ entityRescoped := anEntity atScope: aScope.
			entityRescoped isCollection
				ifTrue: [ ^ entityRescoped includes: myselfRescoped ]
				ifFalse: [ ^ entityRescoped == myselfRescoped ] ]
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingAssociationTypes [

	^ self metamodel additionalProperty: #outgoingAssociationTypes for: self class ifAbsentPut: [ self privateOutgoingAssociationTypes ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingMSEProperties [

	^ self metamodel additionalProperty: #outgoingMSEProperties for: self class ifAbsentPut: [ self privateOutgoingMSEProperties ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentSelectors [

	^ self metamodel additionalProperty: #parentSelectors for: self class ifAbsentPut: [ self privateParentSelectors ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentTypes [

	^ self metamodel additionalProperty: #parentTypes for: self class ifAbsentPut: [ self privateParentTypes ]
	
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parents [
	| res |
	res := OrderedCollection new.
	self parentSelectors do: [ :accessor | (self perform: accessor) ifNotNil: [ :r | res addAll: r asCollection ] ].
	^ res asSet
]

{ #category : #private }
TEntityMetaLevelDependency >> privateAllChildrenTypes [

	^ (self childrenTypes withDeepCollect: #childrenTypes as: Set) asOrderedCollection
]

{ #category : #private }
TEntityMetaLevelDependency >> privateAllIncomingAssociationTypes [
   ^ ((self allChildrenTypes flatCollectAsSet: [:each | each implementingClassesIn: self metamodel ])
		flatCollectAsSet: #incomingAssociationTypes)
       addAll: self incomingAssociationTypes;
       yourself
]

{ #category : #private }
TEntityMetaLevelDependency >> privateAllOutgoingAssociationTypes [
   ^ ((self allChildrenTypes flatCollectAsSet: [:each | each implementingClassesIn: self metamodel ])
		flatCollectAsSet: #outgoingAssociationTypes)
       addAll: self outgoingAssociationTypes;
       yourself
]

{ #category : #private }
TEntityMetaLevelDependency >> privateAllParentTypes [
	^ (self parentTypes withDeepCollect: #parentTypes as: Set) asOrderedCollection
]

{ #category : #private }
TEntityMetaLevelDependency >> privateChildrenSelectors [

	^ self allDeclaredProperties select: #isChildrenProperty thenCollect: #implementingSelector
]

{ #category : #private }
TEntityMetaLevelDependency >> privateChildrenTypes [
	^ ((self allDeclaredProperties select: [ :fm3Prop | fm3Prop isChildrenProperty ])
		collectAsSet: [ :prop | prop type implementingClass ]) asArray
]

{ #category : #private }
TEntityMetaLevelDependency >> privateIncomingAssociationTypes [
	^ self incomingMSEProperties collect: [ :d | d type implementingClass ]
]

{ #category : #private }
TEntityMetaLevelDependency >> privateIncomingMSEProperties [
	^ self dependencyFM3PropertyDescription select: [ :p | p opposite isTarget ]
]

{ #category : #private }
TEntityMetaLevelDependency >> privateOutgoingAssociationTypes [
	^ self outgoingMSEProperties collect: [ :d | d type implementingClass ]
]

{ #category : #private }
TEntityMetaLevelDependency >> privateOutgoingMSEProperties [
	^ self dependencyFM3PropertyDescription select: [ :p | p opposite isSource ]
]

{ #category : #private }
TEntityMetaLevelDependency >> privateParentSelectors [

	^ self allDeclaredProperties select: #isContainer thenCollect: #implementingSelector
]

{ #category : #private }
TEntityMetaLevelDependency >> privateParentTypes [

	| containerBehaviors metamodelClasses containerUsers |
	
	containerBehaviors := self mooseDescription allAttributes select: #isContainer thenCollect: [:prop | prop type implementingClass].
	
	metamodelClasses := self metamodel classes reject: [ :e | e implementingClass isTrait ].
	
	containerUsers := metamodelClasses select: [ :e | 
		containerBehaviors anySatisfy: [ :t | e implementingClass usesMooseTraitDirectly: t ] ].
	
	^ (containerBehaviors, (containerUsers collect: #implementingClass) ) asSet asArray
	

	
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
