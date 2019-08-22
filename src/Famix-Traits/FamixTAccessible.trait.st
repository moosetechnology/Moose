Trait {
	#name : #FamixTAccessible,
	#instVars : [
		'#incomingAccesses => FMMany type: #FamixTAccess opposite: #variable'
	],
	#category : #'Famix-Traits-Access'
}

{ #category : #meta }
FamixTAccessible classSide >> annotation [

	<MSEClass: #TAccessible super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTAccessible >> accessingClasses [

	^(self accessingMethods collectAsSet: [:each | each belongsTo]) asOrderedCollection
]

{ #category : #accessing }
FamixTAccessible >> accessingMethods [

	^ self incomingAccesses collectAsSet: [:anAccess | anAccess accessor].

]

{ #category : #accessing }
FamixTAccessible >> accessors [
	<MSEProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #adding }
FamixTAccessible >> addIncomingAccess: anAccess [
	incomingAccesses add: anAccess
]

{ #category : #accessing }
FamixTAccessible >> globalAccesses [
	| attrclass globalAccesses |
	attrclass := self belongsTo.
	globalAccesses := Set new.
	self
		incomingAccesses do:
			[:anAccess | 
			| ent |
			ent := anAccess accessor.
			ent belongsTo = attrclass ifFalse: [globalAccesses add: anAccess]].
	^globalAccesses
]

{ #category : #accessing }
FamixTAccessible >> incomingAccesses [
	"Relation named: #incomingAccesses type: #FamixTAccess opposite: #variable"

	<generated>
	<MSEComment: 'All Famix accesses pointing to this structural entity'>
	^ incomingAccesses
]

{ #category : #accessing }
FamixTAccessible >> incomingAccesses: anObject [

	<generated>
	incomingAccesses value: anObject

]

{ #category : #accessing }
FamixTAccessible >> localAccesses [
	| attrclass localAccesses |
	attrclass := self belongsTo.
	localAccesses := Set new.
	self
		incomingAccesses do:
			[:anAccess | 
			| ent |
			ent := anAccess accessor.
			ent belongsTo = attrclass ifTrue: [localAccesses add: anAccess]].
	^localAccesses
]

{ #category : #accessing }
FamixTAccessible >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses of an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [self incomingAccesses size]
]

{ #category : #accessing }
FamixTAccessible >> numberOfAccessingClasses [
	<MSEProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<MSEComment: 'The number of classes from which at least one method accesses an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccessingClasses
		computedAs: [self accessingClasses size]
]

{ #category : #accessing }
FamixTAccessible >> numberOfAccessingMethods [
	<MSEProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<MSEComment: 'The number of methods accessing an attribute.'>				
	
	^self
		lookUpPropertyNamed: #numberOfAccessingMethods
		computedAs: [self accessingMethods size]
]

{ #category : #accessing }
FamixTAccessible >> numberOfGlobalAccesses [
	<MSEProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>	

	^self
		lookUpPropertyNamed: #numberOfGlobalAccesses
		computedAs: [self globalAccesses size]
]

{ #category : #accessing }
FamixTAccessible >> numberOfLocalAccesses [
	<MSEProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
		
	^self
		lookUpPropertyNamed: #numberOfLocalAccesses
		computedAs: [self localAccesses size]
]

{ #category : #accessing }
FamixTAccessible >> readAccesses [
	
	^self incomingAccesses select: [:each | each isRead]
]
