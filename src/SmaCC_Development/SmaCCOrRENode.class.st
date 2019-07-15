"
SmaCCOrRENode is a SmaCCRegularExpressionNode that represents several possible regular expression choices. For example, we may have an SmaCCOrRENode that contains a character RE that matches letters when the state is #foo, and another character RE that matches whitespace when the state is #bar.

Instance Variables:
	nodes	<Collection of: SmaCCRegularExpressionNode>	all RE nodes that are being ORed together
"
Class {
	#name : #SmaCCOrRENode,
	#superclass : #SmaCCRegularExpressionNode,
	#instVars : [
		'nodes'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCOrRENode class >> nodes: aCollection [
	^ self new
		nodes: aCollection;
		yourself
]

{ #category : #private }
SmaCCOrRENode >> asNFAStartingWith: aSmaCCNode [
	| endNode startNode |
	startNode := self addStateTransitionsTo: aSmaCCNode.
	endNode := SmaCCNode new.
	endNode action: action.
	nodes
		do:
			[ :each | 
			| componentStart |
			componentStart := SmaCCNode new.
			startNode addEdgeTo: componentStart.
			(each asNFAStartingWith: componentStart) addEdgeTo: endNode ].
	^ endNode
]

{ #category : #constructing }
SmaCCOrRENode >> makeCaseInsensitive [
	nodes do: [ :each | each makeCaseInsensitive ]
]

{ #category : #'initialize-release' }
SmaCCOrRENode >> nodes: aCollection [
	nodes := aCollection
]

{ #category : #private }
SmaCCOrRENode >> possibleMatchesDo: aBlock on: aStream [
	nodes
		do:
			[ :each | 
			| pos |
			pos := aStream position.
			each possibleMatchesDo: aBlock on: aStream.
			aStream position: pos ]
]

{ #category : #accessing }
SmaCCOrRENode >> possibleMatchesSize [
	^ nodes
		inject: 0
		into: [ :sum :each | sum + each possibleMatchesSize ]
]

{ #category : #copying }
SmaCCOrRENode >> postCopy [
	super postCopy.
	nodes := nodes copy
]

{ #category : #printing }
SmaCCOrRENode >> printOn: aStream [
	aStream nextPut: $(.
	nodes
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ' | ' ].
	aStream nextPut: $)
]

{ #category : #constructing }
SmaCCOrRENode >> | aSmaCCRegularExpressionNode [
	self action = aSmaCCRegularExpressionNode action
		ifFalse: [ ^ super | aSmaCCRegularExpressionNode ].
	nodes add: aSmaCCRegularExpressionNode.
	^ self
]
