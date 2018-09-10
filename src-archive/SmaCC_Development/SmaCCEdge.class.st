"
SmaCCEdge is an edge in the DFA/NFA for the scanner. It contains the objects (characters or symbols) that we transition on and the node we transition to.

Subclasses must implement the following messages:
	private
		dispatchTo:seen:

Instance Variables:
	toNode	<SmaCCNode>	the next node in the graph
	transitionObjects	<Collection of: (Character | Symbol))>	the characters or states that we transition on


"
Class {
	#name : #SmaCCEdge,
	#superclass : #Object,
	#instVars : [
		'toNode',
		'transitionObjects'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCEdge class >> to: aSmaCCNode on: aCollectionOrNil [
	| edge |
	edge := self new.
	edge to: aSmaCCNode on: aCollectionOrNil.
	^ edge
]

{ #category : #comparing }
SmaCCEdge >> <= aSmaCCEdge [
	^ true
]

{ #category : #comparing }
SmaCCEdge >> = aSmaCCEdge [
	^ self class = aSmaCCEdge class
		and:
			[ self to = aSmaCCEdge to
				and: [ self transitionObjects = aSmaCCEdge transitionObjects ] ]
]

{ #category : #testing }
SmaCCEdge >> canMergeWith: aSmaCCEdge [
	^ self class = aSmaCCEdge class
]

{ #category : #compiling }
SmaCCEdge >> codeSizeEstimate [
	"Estimate how many bytecodes will be used to generate the comparison."

	^ self subclassResponsibility
]

{ #category : #compiling }
SmaCCEdge >> dispatchTo: aSmaCCCodeGenerator seen: aCollection [
	^ self subclassResponsibility
]

{ #category : #printing }
SmaCCEdge >> edgeLabel [
	^ transitionObjects isNil
		ifTrue: [ 'epsilon' ]
		ifFalse:
			[ transitionObjects
				inject: ''
				into: [ :sum :each | sum , each printString ] ]
]

{ #category : #comparing }
SmaCCEdge >> hash [
	^ (self to hash bitShift: 14) bitXor: transitionObjects hash
]

{ #category : #testing }
SmaCCEdge >> includes: anObject [
	^ transitionObjects includes: anObject
]

{ #category : #testing }
SmaCCEdge >> isCharacterTransition [
	^ false
]

{ #category : #testing }
SmaCCEdge >> isEmpty [
	^ transitionObjects isEmpty
]

{ #category : #testing }
SmaCCEdge >> isEpsilonTransition [
	^ transitionObjects isNil
]

{ #category : #merging }
SmaCCEdge >> mergeWith: aSmaCCEdge [
	transitionObjects := Array
		withAll:
			(transitionObjects , aSmaCCEdge transitionObjects) asSet
				asSortedCollection
]

{ #category : #printing }
SmaCCEdge >> printOn: aStream [
	aStream
		nextPutAll: '---';
		nextPutAll: self edgeLabel;
		nextPutAll: '--->';
		nextPutAll: toNode printString
]

{ #category : #private }
SmaCCEdge >> remove: aCollection [
	transitionObjects := transitionObjects
		reject: [ :each | aCollection includes: each ]
]

{ #category : #accessing }
SmaCCEdge >> setClass [
	^ Set
]

{ #category : #accessing }
SmaCCEdge >> to [
	^ toNode
]

{ #category : #'initialize-release' }
SmaCCEdge >> to: aSmaCCNode [
	toNode := aSmaCCNode
]

{ #category : #'initialize-release' }
SmaCCEdge >> to: aSmaCCNode on: aStringOrNil [
	toNode := aSmaCCNode.
	transitionObjects := aStringOrNil
]

{ #category : #accessing }
SmaCCEdge >> transitionObjects [
	^ transitionObjects
]
