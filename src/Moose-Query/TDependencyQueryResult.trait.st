"
TDependencyQueryResult is a Trait that provides some common MooseQuery selectors to several MooseQueryResult.

For more informations: https://moosequery.ferlicot.fr/
"
Trait {
	#name : #TDependencyQueryResult,
	#category : #'Moose-Query'
}

{ #category : #meta }
TDependencyQueryResult classSide >> annotation [

	<MSEClass: #TDependencyQueryResult super: #Trait>
	<generated>
	<package: #'Moose-Query'>
	^self
]

{ #category : #generator }
TDependencyQueryResult classSide >> generatedSlotNames [
	<generated>
	'TDependencyQueryResult class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
TDependencyQueryResult classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #filtering }
TDependencyQueryResult >> allAtScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allAtScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allToScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allToScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> allWithScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) allWithScope: aClassFamix in: res ]) asSet
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
TDependencyQueryResult >> outOfClass: aFAMIXClass [ 
	
	^ self rejectDependencies: [ :dep | (self opposite: dep) isCollection ifTrue: [ (self opposite: dep) isNotEmpty and: [(self opposite: dep) anySatisfy: [ :anEntity | anEntity typeScope == aFAMIXClass ] ] ] ifFalse: [aFAMIXClass == (self opposite: dep) typeScope]]
]

{ #category : #filtering }
TDependencyQueryResult >> outOfNamespace: aFAMIXNamespace [ 

	^ self rejectDependencies: [ :dep | (self opposite: dep) isCollection ifTrue: [ (self opposite: dep) isNotEmpty and: [(self opposite: dep) anySatisfy: [ :anEntity | anEntity namespaceScope == aFAMIXNamespace ] ] ] ifFalse: [aFAMIXNamespace == (self opposite: dep) namespaceScope]]
]

{ #category : #filtering }
TDependencyQueryResult >> outOfPackage: aFAMIXPackage [ 
	
	^ self rejectDependencies: [ :dep | (self opposite: dep) isCollection ifTrue: [ (self opposite: dep) isNotEmpty and: [(self opposite: dep) anySatisfy: [ :anEntity | anEntity packageScope == aFAMIXPackage ] ] ] ifFalse: [aFAMIXPackage == (self opposite: dep) packageScope]]
]

{ #category : #private }
TDependencyQueryResult >> rejectDependencies: aConditionBlock [ 
	
	^ self newAssocResultWith: (self storage reject: aConditionBlock )
]

{ #category : #private }
TDependencyQueryResult >> selectDependencies: aConditionBlock [ 
	
	^ self newAssocResultWith: (self storage select: aConditionBlock )
]

{ #category : #filtering }
TDependencyQueryResult >> sourceMethods [
	
	^ self collectAsSet: #from
]

{ #category : #filtering }
TDependencyQueryResult >> toScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) toScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> withScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :dep | (self opposite: dep) withScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
TDependencyQueryResult >> within: aFamixEntity [
	^self newAssocResultWith:
		(self storage select: [ :dep | 
			(self isOppositeMultivalued: dep)
				ifTrue: [ (self opposite: dep) anySatisfy: [ :entity |  {aFamixEntity} = (entity atScope: aFamixEntity class) ] ]
				ifFalse: [ {aFamixEntity} = ((self opposite: dep) atScope: aFamixEntity class) ] ])
]

{ #category : #filtering }
TDependencyQueryResult >> withinClass: aFAMIXClass [ 
	
	^ self within: aFAMIXClass 
]

{ #category : #filtering }
TDependencyQueryResult >> withinNamespace: aFAMIXNamespace [ 

	^ self within: aFAMIXNamespace 
]

{ #category : #filtering }
TDependencyQueryResult >> withinPackage: aFAMIXPackage [ 
	
	^ self within: aFAMIXPackage 
]

{ #category : #filtering }
TDependencyQueryResult >> withoutSelfLoops [
	"exclude dependencies which loop back to the receiver"

	^ self reject: [ :dep | (self opposite: dep) asCollection anySatisfy: [ :opp | opp withAllParents includes: self receiver ] ]
]
