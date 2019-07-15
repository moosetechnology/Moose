"
SmaCCRepeatingRENode is a SmaCCRegularExpressionNode that matches a particular RE node multiple times.

Instance Variables:
	maximumMatches	<Integer>	the maximum amount of matches (or #finiteInfinity if we can repeat unlimited number of times)
	minimumMatches	<Integer>	the minimum amount of matches we must accept
	node	<SmaCCRegularExpressionNode>	the node we are matching
"
Class {
	#name : #SmaCCRepeatingRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'node',
		'minimumMatches',
		'maximumMatches'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode [
	^ self component: aSmaCCRegularExpressionNode minimum: 0
]

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode minimum: anInteger [
	^ self
		component: aSmaCCRegularExpressionNode
		minimum: anInteger
		maximum: self finiteInfinity
]

{ #category : #'instance creation' }
SmaCCRepeatingRENode class >> component: aSmaCCRegularExpressionNode minimum: minInteger maximum: maxInteger [
	^ self new
		component: aSmaCCRegularExpressionNode
			minimum: minInteger
			maximum: maxInteger;
		yourself
]

{ #category : #constants }
SmaCCRepeatingRENode class >> finiteInfinity [
	"The number that we consider to be 'infinite'"

	^ 2147483648
]

{ #category : #private }
SmaCCRepeatingRENode >> asNFAStartingWith: aSmaCCNode [
	| endNode start |
	start := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	minimumMatches
		timesRepeat: [ start := node asNFAStartingWith: start ].
	start addEdgeTo: endNode.
	maximumMatches < self class finiteInfinity
		ifTrue:
			[ maximumMatches - minimumMatches
				timesRepeat:
					[ start := node asNFAStartingWith: start.
					start addEdgeTo: endNode ] ]
		ifFalse: [ (node asNFAStartingWith: start) addEdgeTo: start ].
	^ endNode
]

{ #category : #'initialize-release' }
SmaCCRepeatingRENode >> component: aSmaCCRegularExpressionNode minimum: minInteger maximum: maxInteger [
	node := aSmaCCRegularExpressionNode.
	minimumMatches := minInteger.
	maximumMatches := maxInteger
]

{ #category : #constructing }
SmaCCRepeatingRENode >> makeCaseInsensitive [
	node makeCaseInsensitive
]

{ #category : #private }
SmaCCRepeatingRENode >> possibleMatchesDo: aBlock on: aStream [
	self possibleMatchesDo: aBlock on: aStream startingAt: 0
]

{ #category : #private }
SmaCCRepeatingRENode >> possibleMatchesDo: aBlock on: aStream startingAt: anInteger [
	(anInteger between: minimumMatches and: maximumMatches)
		ifTrue: [ aBlock value ].
	anInteger < maximumMatches
		ifTrue:
			[ node
				possibleMatchesDo:
					[ self possibleMatchesDo: aBlock on: aStream startingAt: anInteger + 1 ]
				on: aStream ]
]

{ #category : #accessing }
SmaCCRepeatingRENode >> possibleMatchesSize [
	"This does not return the exact number for expressions with over 50 potential matches since we don't need that detail and computing the exact value may be expensive."

	| baseSize |
	baseSize := node possibleMatchesSize.
	baseSize = 1
		ifTrue: [ ^ node possibleMatchesSize
				* (maximumMatches - minimumMatches + 1) ].
	maximumMatches >= 6
		ifTrue: [ ^ SmallInteger maxVal ].
	^ (minimumMatches to: maximumMatches)
		inject: 0
		into: [ :sum :each | sum + (baseSize raisedTo: each) ]
]

{ #category : #printing }
SmaCCRepeatingRENode >> printOn: aStream [
	aStream nextPut: $(.
	node printOn: aStream.
	aStream nextPut: $).
	maximumMatches = (1 bitShift: 31)
		ifTrue:
			[ minimumMatches = 0
				ifTrue: [ ^ aStream nextPut: $* ].
			minimumMatches = 1
				ifTrue: [ ^ aStream nextPut: $+ ].
			^ aStream
				nextPut: ${;
				nextPutAll: minimumMatches printString;
				nextPutAll: ',}' ].
	aStream
		nextPut: ${;
		nextPutAll: minimumMatches printString;
		nextPut: $,;
		nextPutAll: maximumMatches printString;
		nextPut: $}
]
