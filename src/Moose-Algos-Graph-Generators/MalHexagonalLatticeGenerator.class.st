Class {
	#name : #MalHexagonalLatticeGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'n',
		'm',
		'activeNodes'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #accessing }
MalHexagonalLatticeGenerator >> activeNodes [
	^ activeNodes
]

{ #category : #accessing }
MalHexagonalLatticeGenerator >> activeNodes: anObject [
	activeNodes := anObject
]

{ #category : #running }
MalHexagonalLatticeGenerator >> buildLinks [
	"Connect each nodes to nodes that are in 2 steps "

	nodes
		do: [ :each | 
			| links |
			"Build the top of hexagon"
			(each y \\ 4 = 1 and: [ each x \\ 2 = 1 ])
				ifTrue: [ "and: [ each x \\ 2 = 1 ]"
					links := self nodesAtDistance: 2 toNode: each.
					links
						do: [ :node | 
							node y > each y
								ifTrue: [ self
										addEdge:
											{each model.
											node model}
										from: #first
										to: #second ] ] ].
			"Build the bottom of the hexagon"
			(each y \\ 4 = 3 and: [ each x \\ 2 = 0 ])
				ifTrue: [ "and: [ each x \\ 2 = 1 ]"
					links := self nodesAtDistance: 2 toNode: each.
					links
						do: [ :node | 
							node y > each y
								ifTrue: [ self
										addEdge:
											{each model.
											node model}
										from: #first
										to: #second ] ] ].
			"Build the fisrt sides of the hexagon"
			(each y \\ 4 = 2 and: [ each x \\ 2 = 0 ])
				ifTrue: [ "and: [ each x \\ 2 = 1 ]"
					links := self nodesOnColumnAtDistance: 1 toNode: each.
					links
						do: [ :node | 
							self
								addEdge:
									{each model.
									node model}
								from: #first
								to: #second ] ].
			"Build the other sides of the hexagon"
			(each y \\ 4 = 0 and: [ each x \\ 2 = 1 ])
				ifTrue: [ "and: [ each x \\ 2 = 1 ]"
					links := self nodesOnColumnAtDistance: 1 toNode: each.
					links
						do: [ :node | 
							self
								addEdge:
									{each model.
									node model}
								from: #first
								to: #second ] ] ]
]

{ #category : #configuration }
MalHexagonalLatticeGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #initialization }
MalHexagonalLatticeGenerator >> initializeNodesOnGrid [
	| nbNodes |
	nbNodes := 1.
	nodes
		do: [ :each | 
			each x: (nbNodes - 1) \\ n + 1.
			each y: (nbNodes - 1 quo: n) + 1.
			nbNodes := nbNodes + 1 ]
]

{ #category : #accessing }
MalHexagonalLatticeGenerator >> m [
^m
]

{ #category : #accessing }
MalHexagonalLatticeGenerator >> m: anInteger [
	m := anInteger
]

{ #category : #accessing }
MalHexagonalLatticeGenerator >> n [
	^n
]

{ #category : #accessing }
MalHexagonalLatticeGenerator >> n: anInteger [
	n := anInteger
]

{ #category : #configuration }
MalHexagonalLatticeGenerator >> nodeClass [
	^ Mal2DGridNode
]

{ #category : #running }
MalHexagonalLatticeGenerator >> nodesAtDistance: aDistance toNode: aNode [
	"Return nodes that are at the distance p to a node"

	| i j k l |
	i := aNode x.
	j := aNode y.
	^ nodes
		select: [ :each | 
			k := each x.
			l := each y.
			((k - i) raisedTo:2) + ((l - j) raisedTo:2) = aDistance ]
]

{ #category : #running }
MalHexagonalLatticeGenerator >> nodesOnColumnAtDistance: aDistance toNode: aNode [
	"Return nodes that are at the distance p to a node"

	| i j k l |
	i := aNode x.
	j := aNode y.
	^ nodes
		select: [ :each | 
			k := each x.
			l := each y.
			i = k and: [ l - j = aDistance ] ]
]

{ #category : #removing }
MalHexagonalLatticeGenerator >> removeUnnecessaryNodes [
	| listeActiveNodes |
	listeActiveNodes := OrderedCollection new.
	nodes
		do: [ :each | 
			(each y \\ 4 = 0 and: [ each x \\ 2 = 1 ])
			ifTrue: [ listeActiveNodes add: each ].
			(each y \\ 4 = 1 and: [ each x \\ 2 = 1 ])
				ifTrue: [ listeActiveNodes add: each ].
			(each y \\ 4 = 2 and: [ each x \\ 2 = 0 ])
				ifTrue: [ listeActiveNodes add: each ].
			(each y \\ 4 = 3 and: [ each x \\ 2 = 0 ])
				ifTrue: [ listeActiveNodes add: each ] ].
	self activeNodes: listeActiveNodes
]

{ #category : #running }
MalHexagonalLatticeGenerator >> run [
	self nodes: (1 to: n * m).
	self initializeNodesOnGrid.
	self buildLinks.
	 self removeUnnecessaryNodes
]
