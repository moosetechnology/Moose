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

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allChildrenTypes [
	^ allChildrenTypes ifNil: [ allChildrenTypes := self privateAllChildrenTypes ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allIncomingAssociationTypes [
	"Here we add a cache because this is heavely used in MooseQuery for the navigations."

	^ allIncomingAssociationTypes
		ifNil: [ allIncomingAssociationTypes := self privateAllIncomingAssociationTypes ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allOutgoingAssociationTypes [
	^ self privateAllOutgoingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> allParentTypes [
	^ allParentTypes ifNil: [ allParentTypes := self privateAllParentTypes ]
]

{ #category : #meta }
TEntityMetaLevelDependency classSide >> annotation [

	<MSEClass: #TEntityMetaLevelDependency super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
]

{ #category : #'Moose-Query-Extensions' }
TEntityMetaLevelDependency classSide >> childrenAccessors [
	self
		deprecated: 'Use childrenSelectors instead'
		on: '21 December 2016'
		in: 'Pharo-6.0-60328-'
		transformWith: '`@receiver childrenAccessors' -> '`@receiver childrenSelectors'.
	^ self childrenSelectors
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenSelectors [
	^ childrenSelectors ifNil: [ childrenSelectors := self privateChildrenSelectors ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> childrenTypes [
	^ self privateChildrenTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> dependencyFM3PropertyDescription [
	^ self allDeclaredProperties
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
TEntityMetaLevelDependency classSide >> incomingAssociationTypes [
	"Default value"

	^ self privateIncomingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> incomingMSEProperties [
	^ incomingMSEProperties ifNil: [ incomingMSEProperties := self privateIncomingMSEProperties ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingAssociationTypes [
	"Here we add a cache because this is heavely used in MooseQuery for the navigations."

	^ outgoingAssociationTypes
		ifNil: [ outgoingAssociationTypes := self privateOutgoingAssociationTypes ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> outgoingMSEProperties [
	^ outgoingMSEProperties ifNil: [ outgoingMSEProperties := self privateOutgoingMSEProperties ]
]

{ #category : #'Moose-Query-Extensions' }
TEntityMetaLevelDependency classSide >> parentSelectors [
	^ parentSelectors ifNil: [ parentSelectors := self privateParentSelectors ] 
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> parentTypes [
	^ self privateParentTypes 
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllChildrenTypes [
	^ (self childrenTypes withDeepCollect: #childrenTypes as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllIncomingAssociationTypes [
   ^ ((self allChildrenTypes flatCollectAsSet: [:each | each implementingClassesIn: self metamodel ])
		flatCollectAsSet: #incomingAssociationTypes)
       addAll: self incomingAssociationTypes;
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllOutgoingAssociationTypes [
   ^ ((self allChildrenTypes flatCollectAsSet: [:each | each implementingClassesIn: self metamodel ])
		flatCollectAsSet: #outgoingAssociationTypes)
       addAll: self outgoingAssociationTypes;
       yourself
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateAllParentTypes [
	^ (self parentTypes withDeepCollect: #parentTypes as: Set) asOrderedCollection
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateChildrenSelectors [
	^ self allDeclaredProperties select: #isChildrenProperty thenCollect: #implementingSelector
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateChildrenTypes [
	^ ((self allDeclaredProperties select: [ :fm3Prop | fm3Prop isChildrenProperty ])
		collectAsSet: [ :prop | prop type implementingClass ]) asArray
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateIncomingAssociationTypes [
	^ self incomingMSEProperties collect: [ :d | d type implementingClass ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateIncomingMSEProperties [
	^ self dependencyFM3PropertyDescription select: [ :p | p opposite isTarget ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateOutgoingAssociationTypes [
	^ self outgoingMSEProperties collect: [ :d | d type implementingClass ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateOutgoingMSEProperties [
	^ self dependencyFM3PropertyDescription select: [ :p | p opposite isSource ]
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateParentSelectors [
	^ self allDeclaredProperties select: #isContainer thenCollect: #implementingSelector
]

{ #category : #accessing }
TEntityMetaLevelDependency classSide >> privateParentTypes [

	| containerBehaviors metamodelClasses containerUsers |
	
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
	^ self class allChildrenTypes
]

{ #category : #'as yet unclassified' }
TEntityMetaLevelDependency >> allClients [
	^ self allClientsAtScope: self class
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allClientsAtScope: aClass [
	^ (self queryIncomingDependencies atScope: aClass withNonMatchingEntitiesDo: [ :entities :res | entities ifNotNil: [ res addAll: entities asCollection ] ]) withoutSelfLoops
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allIncomingAssociationTypes [
	^ self class allIncomingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allOutgoingAssociationTypes [
	^ self class allOutgoingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParentTypes [
	^ self class allParentTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency >> allParents [
	"Returns all the parents and sup-parents of an entity, i.e my parents and those of my parents, and those of the parents of my parents, etc"

	^ self addAllParentsIn: OrderedCollection new
]

{ #category : #'as yet unclassified' }
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
TEntityMetaLevelDependency >> childrenAccessors [
	self 
		deprecated: 'Use childrenSelectors instead'
		on: 	'21 December 2016' 
		in: 'Pharo-6.0-60328-'
		transformWith: '`@receiver childrenAccessors' -> '`@receiver childrenSelectors'.
	^ self childrenSelectors
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenEntities [
	self
		deprecated: 'Use #children instead'
		on: '19 Septembre 2017'
		in: 'Moose 6.1'
		transformWith: '`@receiver childrenEntities' -> '`@receiver children'.
	^ self children
]

{ #category : #accessing }
TEntityMetaLevelDependency >> childrenSelectors [
	^ self class childrenSelectors
]

{ #category : #accessing }
TEntityMetaLevelDependency >> dependencyFM3PropertyDescription [
	^ self class dependencyFM3PropertyDescription
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingAssociationTypes [
	^ self class incomingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency >> incomingMSEProperties [
	^ self class incomingMSEProperties 
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
	^ self class outgoingAssociationTypes
]

{ #category : #accessing }
TEntityMetaLevelDependency >> outgoingMSEProperties [
	^ self class outgoingMSEProperties
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentAccessors [
	self
		deprecated: 'Use childrenSelectors instead'
		on: '21 December 2016'
		in: 'Pharo-6.0-60328-'
		transformWith: '`@receiver parentAccessors' -> '`@receiver parentSelectors'.
	^ self parentSelectors
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentEntities [
	self
		deprecated: 'Use #parents instead'
		on: '19 Septembre 2017'
		in: 'Moose 6.1'
		transformWith: '`@receiver parentEntities' -> '`@receiver parents'.
	^ self parents
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentSelectors [
	^ self class parentSelectors
]

{ #category : #accessing }
TEntityMetaLevelDependency >> parentTypes [
	^ self class parentTypes
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
