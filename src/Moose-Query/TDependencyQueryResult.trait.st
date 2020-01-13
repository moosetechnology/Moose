"
TDependencyQueryResult is a Trait that provides some common MooseQuery selectors to several MooseQueryResult.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TDependencyQueryResult,
	#category : #'Moose-Query-Traits'
}

{ #category : #filtering }
TDependencyQueryResult >> allAtAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allAtAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allAtScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allAtScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allToAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allToAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allToScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allToScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allWithAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allWithScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allWithScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> atAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) atAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> atScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) atScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> atScope: aClassFamix withNonMatchingEntitiesDo: aBlock [
	"I do the same at #atScope: but when an element has nothing to return as scope I execute the block with the opposite as first parameter and the result collection as second parameter."

	| res opposite coll |
	res := OrderedCollection new.
	self storage
		do: [ :dep | 
			coll := OrderedCollection new.
			(opposite := self opposite: dep) atScope: aClassFamix in: coll.
			coll ifEmpty: [ aBlock cull: opposite cull: res ] ifNotEmpty: [ :results | res addAll: results ] ].
	^ self newObjectResultWith: res asSet
]

{ #category : #private }
TDependencyQueryResult >> elementAtReceiverScope: dep [
	"returns scope (parents and children) of opposite element matching the scope of the receiver.
	For example, would return the class of an invoked method if query is called on a class."

	^ (self opposite: dep) withScope: self receiver
]

{ #category : #private }
TDependencyQueryResult >> newAssocResultWith: aCollection [

	^ self class on: self receiver withAll: aCollection
]

{ #category : #requirement }
TDependencyQueryResult >> opposite: dep [
	"Returns the opposite (or remote) object in the dependency depending on the incoming/outgoing side.
	incoming -> from.
	outgoing -> to"

	self explicitRequirement 
]

{ #category : #accessing }
TDependencyQueryResult >> opposites [
	^ self newObjectResultWith: (self storage flatCollectAsSet: [ :d | (self opposite: d) asCollection ])
]

{ #category : #filtering }
TDependencyQueryResult >> outOf: aFamixEntity [
	^ self newAssocResultWith: (self storage reject: [ :dep | (self opposite: dep) asCollection anySatisfy: [ :entity | (entity allAtScope: aFamixEntity class) includes: aFamixEntity ] ])
]

{ #category : #private }
TDependencyQueryResult >> rejectDependencies: aConditionBlock [ 
	
	^ self newAssocResultWith: (self storage reject: aConditionBlock )
]

{ #category : #private }
TDependencyQueryResult >> selectDependencies: aConditionBlock [ 
	
	^ self newAssocResultWith: (self storage select: aConditionBlock )
]

{ #category : #accessing }
TDependencyQueryResult >> sources [
	^ (self collectAsSet: #from) flattened
]

{ #category : #accessing }
TDependencyQueryResult >> sourcesAtScope: aFamixTraitOrClass [
	^ self sources flatCollectAsSet: [ :e | e atScope: aFamixTraitOrClass ]
]

{ #category : #accessing }
TDependencyQueryResult >> targets [
	^ (self collectAsSet: #to) flattened
]

{ #category : #accessing }
TDependencyQueryResult >> targetsAtScope: aTraitOrClass [
	^ self targets flatCollectAsSet: [ :e | e atScope: aTraitOrClass ]
]

{ #category : #filtering }
TDependencyQueryResult >> toAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) toAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> toScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) toScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) withAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> withScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) withScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> within: aFamixEntity [
	^ self newAssocResultWith: (self storage select: [ :dep | (self opposite: dep) asCollection anySatisfy: [ :entity | (entity allAtScope: aFamixEntity class) includes: aFamixEntity ] ])
]

{ #category : #filtering }
TDependencyQueryResult >> withoutSelfLoops [
	"exclude dependencies which loop back to the receiver"

	^ self reject: [ :dep | (self opposite: dep) asCollection anySatisfy: [ :opp | opp withAllParents includes: self receiver ] ]
]
