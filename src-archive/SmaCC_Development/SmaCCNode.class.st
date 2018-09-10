Class {
	#name : #SmaCCNode,
	#superclass : #Object,
	#instVars : [
		'transitions',
		'action',
		'id'
	],
	#classVars : [
		'NextId'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'class initialization' }
SmaCCNode class >> initialize [
	NextId := 0
]

{ #category : #comparing }
SmaCCNode >> <= aSmaCCNode [
	^ self id <= aSmaCCNode id
]

{ #category : #comparing }
SmaCCNode >> = anObject [
	^ self class = anObject class and: [ self id = anObject id ]
]

{ #category : #accessing }
SmaCCNode >> action [
	^ action
]

{ #category : #'initialize-release' }
SmaCCNode >> action: anObject [
	anObject isNil
		ifTrue: [ ^ self ].
	action := anObject isSymbol
		ifTrue: [ anObject ]
		ifFalse: [ SortedCollection with: anObject ]
]

{ #category : #'compiling-scanner' }
SmaCCNode >> actionForSpecificRegularExpression: aSmaCCRegularExpression [
	| matchedAction strings startingStates first |
	strings := aSmaCCRegularExpression possibleMatches.
	startingStates := transitions first isCharacterTransition
		ifTrue: [ Array with: self ]
		ifFalse:
			[ aSmaCCRegularExpression states
				collect:
					[ :each | 
					(transitions detect: [ :edge | edge includes: each ] ifNone: [ nil ])
						ifNotNil: [ :edge | edge to ] ] ].
	(startingStates includes: nil)
		ifTrue: [ ^ nil ].
	first := true.
	strings
		do:
			[ :each | 
			startingStates
				do:
					[ :node | 
					first
						ifTrue:
							[ matchedAction := node simulate: (ReadStream on: each).
							first := false ]
						ifFalse:
							[ matchedAction = (node simulate: (ReadStream on: each))
								ifFalse: [ ^ nil ] ] ] ].
	^ matchedAction
]

{ #category : #accessing }
SmaCCNode >> addActions: aCollection [
	aCollection isNil
		ifTrue: [ ^ self ].
	action isNil
		ifTrue: [ ^ action := aCollection copy ].
	action isSymbol
		ifTrue: [ ^ self ].
	aCollection isSymbol
		ifTrue: [ ^ action := aCollection ].
	aCollection
		do: [ :each | 
			(action includes: each)
				ifFalse: [ action add: each ] ]
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode [
	transitions add: (SmaCCEdge to: aSmaCCNode on: nil)
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode onCharacters: characterCollection [
	transitions
		add: (SmaCCCharacterEdge to: aSmaCCNode on: characterCollection)
]

{ #category : #edges }
SmaCCNode >> addEdgeTo: aSmaCCNode onStates: symbolCollection [
	transitions add: (SmaCCStateEdge to: aSmaCCNode on: symbolCollection)
]

{ #category : #accessing }
SmaCCNode >> allStates [
	| nodes |
	nodes := Set new.
	self allStatesInto: nodes.
	^ nodes
]

{ #category : #accessing }
SmaCCNode >> allStatesInto: aSet [
	(aSet includes: self)
		ifTrue: [ ^ self ].
	aSet add: self.
	transitions do: [ :each | each to allStatesInto: aSet ]
]

{ #category : #converting }
SmaCCNode >> asDFA [
	| new |
	new := (SmaCCNFAtoDFA
		convertToDFA: self asNFAWithoutEpsilonTransitions)
		startingNodeWithoutUnnecessaryDefaultTransition.
	new removeDuplicateNodes.
	new orderNodes.
	^ new
]

{ #category : #accessing }
SmaCCNode >> asDOTstring [
	| nodeStream mapStream |
	nodeStream := WriteStream on: String new.
	nodeStream
		nextPutAll:
			'digraph finite_state_machine {
	rankdir=LR;
	size="100,100"';
		cr.
	mapStream := WriteStream on: String new.
	self allStates
		do:
			[ :each | 
			nodeStream
				nextPutAll: 'node [ style=filled, shape = circle, fillcolor = ';
				nextPutAll:
					(each action notNil
						ifTrue: [ 'green' ]
						ifFalse: [ 'white' ]);
				nextPutAll: '];';
				nextPutAll: each id printString;
				nextPut: $;;
				cr.
			each transitions
				do:
					[ :trans | 
					| edge |
					mapStream
						nextPutAll: each id printString;
						nextPutAll: ' -> ';
						nextPutAll: trans to id printString;
						nextPutAll: '[ label = "'.
					edge := trans edgeLabel displayString.
					edge size > 100
						ifTrue: [ edge := '...' ].
					mapStream
						nextPutAll: edge;
						nextPutAll: '"];';
						cr ] ].
	mapStream nextPut: $}.
	^ nodeStream contents , mapStream contents
]

{ #category : #converting }
SmaCCNode >> asNFAWithoutEpsilonTransitions [
	^ SmaCCEpsilonRemoval removeEpsilonEdgesFrom: self
]

{ #category : #'compiling-scanner' }
SmaCCNode >> codeSizeEstimate: methodStates [
	"Estimate how many bytecodes will be generated from this node and its containing nodes."

	^ 8
		+
			(self transitions
				inject: 0
				into:
					[ :sum :each | 
					sum
						+
							(each codeSizeEstimate
								+
									((self == each to or: [ methodStates includes: each to ])
										ifTrue: [ 4 ]
										ifFalse: [ each to codeSizeEstimate: methodStates ])) ])
]

{ #category : #'initialize-release' }
SmaCCNode >> getId [
	^ NextId := NextId + 1
]

{ #category : #accessing }
SmaCCNode >> groupedTransitions [
	^ transitions
		inject: OrderedCollection new
		into:
			[ :sum :each | 
			(sum
				detect: [ :edgeCollection | edgeCollection first canMergeWith: each ]
				ifNone: [ sum add: OrderedCollection new ]) add: each.
			sum ]
]

{ #category : #testing }
SmaCCNode >> hasSimpleLoop [
	^ transitions anySatisfy: [ :each | each to = self ]
]

{ #category : #comparing }
SmaCCNode >> hash [
	^ id bitShift: 4
]

{ #category : #accessing }
SmaCCNode >> id [
	^ id
]

{ #category : #'initialize-release' }
SmaCCNode >> initialize [
	super initialize.
	id := self getId.
	transitions := SortedCollection new
]

{ #category : #testing }
SmaCCNode >> isTerminalNode [
	^ transitions isEmpty
		or: [ transitions size = 1 and: [ self hasSimpleLoop ] ]
]

{ #category : #accessing }
SmaCCNode >> mergeTransitions [
	self groupedTransitions
		do:
			[ :edges | 
			| toMap |
			toMap := Dictionary new.
			edges
				do:
					[ :each | 
					(toMap includesKey: each to)
						ifTrue:
							[ (toMap at: each to) mergeWith: each.
							transitions remove: each ]
						ifFalse: [ toMap at: each to put: each ] ] ]
]

{ #category : #accessing }
SmaCCNode >> mergeWith: aSmaCCNode [
	id := aSmaCCNode id.
	transitions := aSmaCCNode transitions.
	action := aSmaCCNode action
]

{ #category : #converting }
SmaCCNode >> orderNodes [
	self orderNodesWithId: NextId map: Dictionary new
]

{ #category : #converting }
SmaCCNode >> orderNodesWithId: anInteger map: aDictionary [
	anInteger <= id
		ifTrue: [ ^ self ].
	id := aDictionary at: id ifAbsentPut: [ self getId ].
	self sortedTransitions
		do: [ :each | each to orderNodesWithId: anInteger map: aDictionary ]
]

{ #category : #printing }
SmaCCNode >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: id printString;
		nextPut: $)
]

{ #category : #accessing }
SmaCCNode >> removeDuplicateNodes [
	^ SmaCCDuplicateNodeEliminator removeDuplicateNodesIn: self
]

{ #category : #copying }
SmaCCNode >> shallowCopy [
	| copy |
	copy := self class new.
	copy action: action.
	^ copy
]

{ #category : #simulating }
SmaCCNode >> simulate: aStream [
	| char |
	aStream atEnd
		ifTrue: [ ^ action ].
	char := aStream next.
	transitions
		do: [ :each | 
			(each includes: char)
				ifTrue: [ ^ each to simulate: aStream ] ].
	^ nil
]

{ #category : #converting }
SmaCCNode >> sortedTransitions [
	^ transitions asSortedCollection: [ :a :b | a <= b ]
]

{ #category : #accessing }
SmaCCNode >> startingNodeWithoutUnnecessaryDefaultTransition [
	| edge |
	self transitions size = 1
		ifFalse: [ ^ self ].
	edge := self transitions first.
	(edge includes: #default)
		ifTrue: [ ^ edge to ].
	^ self
]

{ #category : #accessing }
SmaCCNode >> transitions [
	^ transitions
]

{ #category : #accessing }
SmaCCNode >> transitions: aCollection [
	transitions size to: 1 by: -1 do: [ :i | transitions removeAt: i ].
	transitions addAll: aCollection
]
