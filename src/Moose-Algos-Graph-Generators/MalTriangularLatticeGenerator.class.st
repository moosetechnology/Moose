"
The triangular lattice graph is a two-dimensional grid graph in which each square unit has a diagonal edge (each grid unit has a chord).

- n: integer - number of rows in the lattice
- m: integer - number of columns int the lattice

The returned graph has m rows and n columns of triangles. Rows and columns include both triangles pointing up and down. Rows form a strip of constant height. Columns form a series of diamond shapes, staggered with the columns on either side. Another way to state the size is that the nodes form a grid of m+1 rows and (n + 1) // 2 columns. The odd row nodes are shifted horizontally relative to the even rows.
"
Class {
	#name : #MalTriangularLatticeGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'n',
		'm',
		'activeNodes'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #accessing }
MalTriangularLatticeGenerator >> activeNodes [
	^ activeNodes
]

{ #category : #accessing }
MalTriangularLatticeGenerator >> activeNodes: anObject [
	activeNodes := anObject
]

{ #category : #running }
MalTriangularLatticeGenerator >> buildLinks [
	"Connect each nodes to nodes that are in 2 steps "

	nodes
		do: [ :each | 
			| links lineLinks|
			"Build chord between nodes situated on diffenents lines"
			(each x \\ 2 = 1 and: [ each y \\ 2 = 1 ])
				ifTrue: [ links := self nodesAtDistance: 2 toNode: each.
					links
						do: [ :node | 
							self
								addEdge:
									{each model.
									node model}
								from: #first
								to: #second ] ].
			"Build chord between nodes on the same line"
			(each x + each y) \\ 2 = 0
				ifTrue: [ lineLinks := self nodesOnLineAtDistance: 2 toNode: each.
					lineLinks
						do: [ :node | 
							self
								addEdge:
									{each model.
									node model}
								from: #first
								to: #second ] ] ]
]

{ #category : #configuration }
MalTriangularLatticeGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #initialization }
MalTriangularLatticeGenerator >> initializeNodesOnGrid [
	| nbNodes |
	nbNodes := 1.
	nodes
		do: [ :each | 
			each x: (nbNodes - 1) \\ n + 1.
			each y: (nbNodes - 1 quo: n) + 1.
			nbNodes := nbNodes + 1 ]
]

{ #category : #accessing }
MalTriangularLatticeGenerator >> m [
	^m 
]

{ #category : #accessing }
MalTriangularLatticeGenerator >> m: anInteger [
	m := anInteger
]

{ #category : #accessing }
MalTriangularLatticeGenerator >> n [
	^n
]

{ #category : #accessing }
MalTriangularLatticeGenerator >> n: anInteger [
	n := anInteger
]

{ #category : #configuration }
MalTriangularLatticeGenerator >> nodeClass [
	^ Mal2DGridNode
]

{ #category : #running }
MalTriangularLatticeGenerator >> nodesAtDistance: aDistance toNode: aNode [
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
MalTriangularLatticeGenerator >> nodesOnLineAtDistance: aDistance toNode: aNode [
	"Return nodes that are at the distance p to a node"

	| i j k l |
	i := aNode x.
	j := aNode y.
	^ nodes
		select: [ :each | 
			k := each x.
			l := each y.
			l = j and: [ k - i = aDistance ] ]
]

{ #category : #removing }
MalTriangularLatticeGenerator >> removeUnnecessaryNodes [
	| listeActiveNodes |
	listeActiveNodes := OrderedCollection new.
	nodes
		do: [ :each | 
			(each x + each y) \\ 2 = 0
				ifTrue: [ listeActiveNodes add: each ] ].
	 self activeNodes:listeActiveNodes.
]

{ #category : #running }
MalTriangularLatticeGenerator >> run [
	self nodes: (1 to: n * m).
	self initializeNodesOnGrid.
	self buildLinks.
	self removeUnnecessaryNodes
]
