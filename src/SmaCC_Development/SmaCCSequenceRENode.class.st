"
SmaCCSequenceRENode is a SmaCCRegularExpressionNode that matches a sequence of other RE nodes.

Instance Variables:
	nodes	<SequenceableCollection of: SmaCCRegularExpressionNode>	an ordered list of nodes to match


"
Class {
	#name : #SmaCCSequenceRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'nodes'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCSequenceRENode class >> nodes: aCollection [
	^ self new
		nodes: aCollection;
		yourself
]

{ #category : #constructing }
SmaCCSequenceRENode >> , aSmaCCRegularExpressionNode [
	self action = aSmaCCRegularExpressionNode action
		ifFalse: [ ^ super , aSmaCCRegularExpressionNode ].
	nodes add: aSmaCCRegularExpressionNode.
	^ self
]

{ #category : #private }
SmaCCSequenceRENode >> asNFAStartingWith: aSmaCCNode [
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	(nodes
		inject: startNode
		into: [ :sum :each | each asNFAStartingWith: sum ])
		addEdgeTo: endNode.
	^ endNode
]

{ #category : #constructing }
SmaCCSequenceRENode >> makeCaseInsensitive [
	nodes do: [ :each | each makeCaseInsensitive ]
]

{ #category : #'initialize-release' }
SmaCCSequenceRENode >> nodes: aCollection [
	nodes := aCollection
]

{ #category : #private }
SmaCCSequenceRENode >> possibleMatchesDo: aBlock on: aStream [
	self possibleMatchesDo: aBlock on: aStream startingAt: 1
]

{ #category : #private }
SmaCCSequenceRENode >> possibleMatchesDo: aBlock on: aStream startingAt: anInteger [
	| node |
	node := nodes at: anInteger.
	nodes size = anInteger
		ifTrue: [ node possibleMatchesDo: aBlock on: aStream ]
		ifFalse:
			[ node
				possibleMatchesDo:
					[ self possibleMatchesDo: aBlock on: aStream startingAt: anInteger + 1 ]
				on: aStream ]
]

{ #category : #accessing }
SmaCCSequenceRENode >> possibleMatchesSize [
	^ nodes
		inject: 1
		into: [ :sum :each | sum * each possibleMatchesSize ]
]

{ #category : #copying }
SmaCCSequenceRENode >> postCopy [
	super postCopy.
	nodes := nodes copy
]

{ #category : #printing }
SmaCCSequenceRENode >> printOn: aStream [
	nodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream space ]
]
