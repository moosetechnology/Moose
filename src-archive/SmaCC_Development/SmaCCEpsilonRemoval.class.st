"
SmaCCEpsilonRemoval removes all epsilon edges from the scanner's NFA.

Instance Variables:
	nodeMap	<Dictionary key: SmaCCNode value: SmaCCNode>	map from nodes in old graph to nodes in new graph


"
Class {
	#name : #SmaCCEpsilonRemoval,
	#superclass : #SmaCCGraphAlgorithm,
	#instVars : [
		'nodeMap'
	],
	#category : #'SmaCC_Development'
}

{ #category : #algorithm }
SmaCCEpsilonRemoval class >> removeEpsilonEdgesFrom: aSmaCCNode [
	"Returns an equivalent graph to aSmaCCNode that doesn't contain any epsilon transitions"

	^ self new removeEpsilonEdgesFrom: aSmaCCNode
]

{ #category : #algorithm }
SmaCCEpsilonRemoval >> createNodeWithoutEpsilonEdges: aSmaCCNode [
	| newNode newTransitions |
	newNode := self
		createMergedNodeFrom: (self epsilonReachableNodesFrom: aSmaCCNode).
	nodeMap at: aSmaCCNode put: newNode.
	newTransitions := OrderedCollection new.
	newNode transitions
		do:
			[ :each | 
			each isEpsilonTransition
				ifFalse:
					[ newTransitions
						add:
							(each class
								to: (self removeEpsilonEdgesFrom: each to)
								on: each transitionObjects) ] ].
	newNode transitions: newTransitions.
	^ newNode
]

{ #category : #algorithm }
SmaCCEpsilonRemoval >> epsilonReachableNodesFrom: aSmaCCNode [
	| todo reachable node |
	reachable := Set with: aSmaCCNode.
	todo := OrderedCollection with: aSmaCCNode.
	[ todo notEmpty ]
		whileTrue:
			[ node := todo removeLast.
			node transitions
				do:
					[ :each | 
					(each isEpsilonTransition and: [ (reachable includes: each to) not ])
						ifTrue: [ reachable add: each to.
							todo add: each to ] ] ].
	^ reachable
]

{ #category : #'initialize-release' }
SmaCCEpsilonRemoval >> initialize [
	super initialize.
	nodeMap := Dictionary new
]

{ #category : #algorithm }
SmaCCEpsilonRemoval >> removeEpsilonEdgesFrom: aSmaCCNode [
	^ nodeMap
		at: aSmaCCNode
		ifAbsent: [ self createNodeWithoutEpsilonEdges: aSmaCCNode ]
]
