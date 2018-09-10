Class {
	#name : #SmaCCGraphAlgorithm,
	#superclass : #Object,
	#category : #'SmaCC_Development'
}

{ #category : #nodes }
SmaCCGraphAlgorithm >> createMergedNodeFrom: nodeCollection [
	| newNode |
	newNode := SmaCCNode new.
	self mergeTransitionsFrom: nodeCollection into: newNode.
	self mergeActionsFrom: nodeCollection into: newNode.
	^ newNode
]

{ #category : #nodes }
SmaCCGraphAlgorithm >> mergeActionsFrom: nodeCollection into: aSmaCCNode [
	nodeCollection do: [ :each | aSmaCCNode addActions: each action ]
]

{ #category : #nodes }
SmaCCGraphAlgorithm >> mergeTransitionsFrom: nodeCollection into: aSmaCCNode [
	| transitions |
	transitions := Set new.
	nodeCollection
		do: [ :each | each transitions do: [ :edge | transitions add: edge copy ] ].
	aSmaCCNode transitions: transitions.
	aSmaCCNode mergeTransitions
]
