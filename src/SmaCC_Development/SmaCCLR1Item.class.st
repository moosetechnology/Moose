Class {
	#name : #SmaCCLR1Item,
	#superclass : #Object,
	#instVars : [
		'rhs',
		'location',
		'followers',
		'itemSet'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCLR1Item class >> rhs: aSmaCCRHS follow: aSmaCCSymbolCollection [
	^ self new
		rhs: aSmaCCRHS follow: aSmaCCSymbolCollection;
		yourself
]

{ #category : #comparing }
SmaCCLR1Item >> = aSmaCCLR1Item [
	^ self class == aSmaCCLR1Item class
		and:
			[ location = aSmaCCLR1Item location
				and: [ rhs == aSmaCCLR1Item rhs
						and: [ self symbol == aSmaCCLR1Item symbol ] ] ]
]

{ #category : #accessing }
SmaCCLR1Item >> action: aSmaCCSymbol [
	self isAtEnd
		ifTrue:
			[ (self symbol isStartingSymbol and: [ aSmaCCSymbol isEmptySymbol ])
				ifTrue: [ ^ SmaCCAcceptAction item: self ].
			(followers includes: aSmaCCSymbol)
				ifTrue: [ ^ SmaCCReduceAction item: self ] ]
		ifFalse:
			[ (rhs at: location) = aSmaCCSymbol
				ifTrue: [ ^ SmaCCShiftAction item: self ] ].
	^ SmaCCRejectAction item: self
]

{ #category : #accessing }
SmaCCLR1Item >> followers [
	^ followers
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> followers: aSmaCCSymbolSet [
	followers := aSmaCCSymbolSet
]

{ #category : #accessing }
SmaCCLR1Item >> grammar [
	^ rhs grammar
]

{ #category : #comparing }
SmaCCLR1Item >> hash [
	^ (self symbol identityHash bitXor: (location bitShift: 14))
		bitXor: rhs identityHash
]

{ #category : #accessing }
SmaCCLR1Item >> isAtEnd [
	^ location > rhs size
]

{ #category : #testing }
SmaCCLR1Item >> isLR1EqualTo: aSmaCCLR1Item [
	^ self followers size = aSmaCCLR1Item followers size
		and:
			[ self followers
				allSatisfy: [ :each | aSmaCCLR1Item followers includes: each ] ]
]

{ #category : #accessing }
SmaCCLR1Item >> itemSet: aSmaCCItemSet [
	itemSet := aSmaCCItemSet
]

{ #category : #accessing }
SmaCCLR1Item >> location [
	^ location
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> location: anInteger [
	location := anInteger
]

{ #category : #accessing }
SmaCCLR1Item >> mergeWith: aSmaCCLR1Item [
	followers mergeWith: aSmaCCLR1Item followers
]

{ #category : #accessing }
SmaCCLR1Item >> moveNext [
	^ self copy
		followers: (followers class basedOn: followers);
		location: location + 1;
		yourself
]

{ #category : #accessing }
SmaCCLR1Item >> nextSymbol [
	^ location > rhs size
		ifTrue: [ self grammar sentinelSymbol ]
		ifFalse: [ rhs at: location ]
]

{ #category : #accessing }
SmaCCLR1Item >> path [
	^ itemSet path
]

{ #category : #accessing }
SmaCCLR1Item >> precedence [
	| max |
	self isAtEnd
		ifTrue:
			[ max := -1.	"If we don't have a precedence, then assume we are the lowest precedence (which will cause a shift action)."
			rhs
				do: [ :each | max := max max: (each precedence ifNil: [ max ]) ].
			^ max ]
		ifFalse: [ ^ (rhs at: location) precedence ]
]

{ #category : #printing }
SmaCCLR1Item >> printOn: aStream [
	| i |
	aStream
		nextPut: $[;
		nextPutAll: self symbol printString;
		nextPutAll: ' :'.
	i := 1.
	rhs
		do:
			[ :each | 
			i = location
				ifTrue: [ aStream nextPutAll: ' . ' ].
			aStream
				space;
				nextPutAll: each printString.
			i := i + 1 ].
	location > rhs size
		ifTrue: [ aStream nextPutAll: ' . ' ].
	aStream nextPut: $;.
	followers printOn: aStream.
	aStream nextPut: $]
]

{ #category : #accessing }
SmaCCLR1Item >> rest [
	| newRHS |
	newRHS := self grammar newRHS.
	location + 1 to: rhs size do: [ :each | newRHS add: (rhs at: each) ].
	^ newRHS
]

{ #category : #accessing }
SmaCCLR1Item >> rhs [
	^ rhs
]

{ #category : #'initialize-release' }
SmaCCLR1Item >> rhs: aSmaCCRHS follow: aSmaCCSymbolCollection [
	rhs := aSmaCCRHS.
	location := 1.
	followers := aSmaCCSymbolCollection
]

{ #category : #accessing }
SmaCCLR1Item >> symbol [
	^ self rhs productionSymbol
]
