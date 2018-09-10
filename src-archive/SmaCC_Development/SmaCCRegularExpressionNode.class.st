"
SmaCCRegularExpressionNode is an abstract class that is used during the construction of the scanner. When the scanner definition is parsed, it creates the SmaCCRegularExpressionNode objects. These objects are then converted to an NFA graph that is converted to a DFA that is compiled.

Subclasses must implement the following messages:
	accessing
		possibleMatchesSize
	private
		asNFAStartingWith:
		possibleMatchesDo:on:

Instance Variables:
	action	<Object>	this is a symbol that is performed on the scanner, an integer for the token id, or nil if we can't accept a token at this position
	position	<Integer>	the position in the scanner definition for this RE -- this is only used for overlapping tokens. Tokens that are defined earlier in the definition are preferred over later ones (except for those used in the parser's definition)
	states	<Collection of: Symbol>	the states where this RE is valid

"
Class {
	#name : #SmaCCRegularExpressionNode,
	#superclass : #Object,
	#instVars : [
		'action',
		'position',
		'states'
	],
	#category : #'SmaCC_Development'
}

{ #category : #constructing }
SmaCCRegularExpressionNode >> , aSmaCCRegularExpressionNode [
	^ SmaCCSequenceRENode
		nodes: (OrderedCollection with: self with: aSmaCCRegularExpressionNode)
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> action [
	^ action
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> action: aString [
	action := aString
]

{ #category : #'accessing-states' }
SmaCCRegularExpressionNode >> addState: aSymbol [
	states add: aSymbol
]

{ #category : #private }
SmaCCRegularExpressionNode >> addStateTransitionsTo: aSmaCCNode [
	| endNode |
	states isEmpty
		ifTrue: [ ^ aSmaCCNode ].
	endNode := SmaCCNode new.
	aSmaCCNode
		addEdgeTo: endNode
		onStates: states asSortedCollection asArray.
	^ endNode
]

{ #category : #'accessing-states' }
SmaCCRegularExpressionNode >> addStates: aCollection [
	states addAll: aCollection
]

{ #category : #converting }
SmaCCRegularExpressionNode >> asDFA [
	| startNode |
	startNode := self asNFA.
	^ startNode asDFA
]

{ #category : #converting }
SmaCCRegularExpressionNode >> asNFA [
	| startNode |
	startNode := SmaCCNode new.
	self asNFAStartingWith: startNode.
	^ startNode
]

{ #category : #private }
SmaCCRegularExpressionNode >> asNFAStartingWith: aSmaCCNode [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> initialize [
	super initialize.
	states := Set new
]

{ #category : #testing }
SmaCCRegularExpressionNode >> isKeywordLiteral [
	^ self possibleMatchesSize < 50
		and:
			[ self
				possibleMatchesDo: [ :each | 
					each size > 1
						ifTrue: [ ^ true ] ].
			false ]
]

{ #category : #constructing }
SmaCCRegularExpressionNode >> makeCaseInsensitive [
	
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> position [
	^ position
]

{ #category : #'initialize-release' }
SmaCCRegularExpressionNode >> position: anInteger [
	position := anInteger
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatches [
	| matches |
	matches := OrderedCollection new.
	self possibleMatchesDo: [ :each | matches add: each ].
	^ matches
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatchesDo: aBlock [
	| stream |
	stream := WriteStream with: String new.
	self possibleMatchesDo: [ aBlock value: stream contents ] on: stream
]

{ #category : #private }
SmaCCRegularExpressionNode >> possibleMatchesDo: aBlock on: aStream [
	self subclassResponsibility
]

{ #category : #accessing }
SmaCCRegularExpressionNode >> possibleMatchesSize [
	^ self subclassResponsibility
]

{ #category : #copying }
SmaCCRegularExpressionNode >> postCopy [
	super postCopy.
	states := Set new
]

{ #category : #constructing }
SmaCCRegularExpressionNode >> repeat [
	^ SmaCCRepeatingRENode component: self
]

{ #category : #constructing }
SmaCCRegularExpressionNode >> repeatFor: minimum to: maximum [
	^ SmaCCRepeatingRENode
		component: self
		minimum: minimum
		maximum: maximum
]

{ #category : #constructing }
SmaCCRegularExpressionNode >> repeatForAtLeast: minimum [
	^ SmaCCRepeatingRENode component: self minimum: minimum
]

{ #category : #'accessing-states' }
SmaCCRegularExpressionNode >> states [
	^ states
]

{ #category : #constructing }
SmaCCRegularExpressionNode >> | aSmaCCRegularExpressionNode [
	^ SmaCCOrRENode
		nodes: (OrderedCollection with: self with: aSmaCCRegularExpressionNode)
]
