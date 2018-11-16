Class {
	#name : #SmaCCNFAtoDFA,
	#superclass : #SmaCCGraphAlgorithm,
	#instVars : [
		'mergedStates'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCNFAtoDFA class >> convertToDFA: aSmaCCNode [
	"Returns an equivalent DFA from the NFA specified by aSmaCCNode -- the NFA must not contain epsilon edges."

	^ self new convertToDFA: aSmaCCNode
]

{ #category : #edges }
SmaCCNFAtoDFA >> commonTransitionObjectsForEdges: edgeCollection [
	^ edgeCollection
		inject: edgeCollection first transitionObjects
		into: [ :sum :each | sum smaccIntersect: each transitionObjects ]
]

{ #category : #algorithm }
SmaCCNFAtoDFA >> convertToDFA: aSmaCCNode [
	^ self mergedNodeFor: (Array with: aSmaCCNode)
]

{ #category : #edges }
SmaCCNFAtoDFA >> createEdgeMerging: conflictingEdgeCollection [
	| newNode common newEdge |
	newNode := self
		mergedNodeFor: (conflictingEdgeCollection collect: [ :each | each to ]).
	common := self
		commonTransitionObjectsForEdges: conflictingEdgeCollection.
	newEdge := conflictingEdgeCollection first class
		to: newNode
		on: common.
	conflictingEdgeCollection do: [ :each | each remove: common ].
	^ newEdge
]

{ #category : #'merging nodes' }
SmaCCNFAtoDFA >> eliminateDuplicateTransitionsIn: aSmaCCNode [
	| newTransitions conflictingObject |
	newTransitions := aSmaCCNode transitions
		collect: [ :each | each copy ].
	[ conflictingObject := self someDuplicateIn: newTransitions.
	conflictingObject notNil ]
		whileTrue:
			[ | conflictingEdges newEdge |
			conflictingEdges := newTransitions
				select: [ :each | each includes: conflictingObject ].
			newEdge := self createEdgeMerging: conflictingEdges.
			newTransitions add: newEdge ].
	self setTransitionsOn: aSmaCCNode to: newTransitions
]

{ #category : #'initialize-release' }
SmaCCNFAtoDFA >> initialize [
	super initialize.
	mergedStates := Dictionary new
]

{ #category : #'merging nodes' }
SmaCCNFAtoDFA >> mergedNodeFor: nodeCollection [
	| mergedNodes |
	mergedNodes := nodeCollection asSortedCollection asArray.
	^ mergedStates
		at: mergedNodes
		ifAbsent:
			[ | newNode |
			newNode := self createMergedNodeFrom: mergedNodes.
			mergedStates
				at: mergedNodes put: newNode;
				at: (Array with: newNode) put: newNode.
			self eliminateDuplicateTransitionsIn: newNode.
			newNode ]
]

{ #category : #edges }
SmaCCNFAtoDFA >> setTransitionsOn: aSmaCCNode to: edgeCollection [
	aSmaCCNode
		transitions: (edgeCollection reject: [ :each | each isEmpty ]).
	aSmaCCNode transitions
		do: [ :each | each to: (self convertToDFA: each to) ]
]

{ #category : #edges }
SmaCCNFAtoDFA >> someDuplicateIn: edgeCollection [
	| objects |
	objects := SmaCCSet new.
	edgeCollection
		do: [ :edge | 
			(objects commonElementWith: edge transitionObjects) ifNotNil: [ :each | ^ each ].
			objects addAll: edge transitionObjects ].
	^ nil
]
