"
A navigable small-world graph is a directed grid with additional long-range connections that are chosen randomly. We use the algorithm defined by Kleinberg: https://www.cs.cornell.edu/home/kleinber/swn.pdf

Begin with a set of nodes that are identified with the set of lattice points in an n×nn×n square, (i,j):i∈1,2,…,n,j∈1,2,…,n(i,j):i∈1,2,…,n,j∈1,2,…,n and define the lattice distance between two nodes (i,j)(i,j) and (k,l)(k,l) to be the number of “lattice steps” separating them: d((i,j),(k,l))=|k−i|+|l−j|d((i,j),(k,l))=|k−i|+|l−j|.

For a universal constant p, the node u has a directed edge to every other node within lattice distance p (local contacts) .

For universal constants q≥>= 0 and r >= 0 construct directed edges from u to q other nodes (long-range contacts) using independent random trials; the i’th directed edge from uu has endpoint v with probability proportional to d(u,v)^-r.

- n: integer - the size of 2D grid (n * n)
- p: integer - the number of local contacts for each nodes
- q: integer - the number of long-range links for each nodes
- r: float - Exponent for decaying probability of connections. The probability of connecting to a node at lattice distance d is 1/d^r.

We follow more or less the implementation of NetworkX : https://networkx.readthedocs.io/en/stable/_modules/networkx/generators/geometric.html#navigable_small_world_graph
Should be verify !
"
Class {
	#name : #MalKleinbergGraphGenerator,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'n',
		'p',
		'q',
		'r'
	],
	#category : #'Moose-Algos-Graph-Generators'
}

{ #category : #running }
MalKleinbergGraphGenerator >> buildLocalLinks [
	"Connect each nodes to nodes that are in p steps (following the manhattan distance)"

	nodes
		do: [ :each | 
			| links |
			links := self nodesLessThanDistance: p toNode: each.
			links
				do: [ :node | 
					self
						addEdge:
							{each model.
							node model}
							from: #first
								to: #second ] ]
]

{ #category : #running }
MalKleinbergGraphGenerator >> buildLongRangeLinks [
	"Build q long range links for each nodes"

|probs cdf |
q == 0 ifFalse: [ 
	r == 0
		ifTrue: [ self buildUniformDistributionOfLongRangeLinks ]
		ifFalse: [ nodes
				do: [ :n1 | 
					probs := #(0) asOrderedCollection.	
					nodes do: [ :n2 |
						|d|
						n1 == n2 ifFalse: [  
						d := self distanceFrom: n1 to:n2.
						probs add: (d raisedTo: r negated).
						]].
					cdf := probs cumsum asSortedCollection.
					"We create q long range links"
						q timesRepeat: [ |target|
							target := nodes at: (cdf indexForInserting: (cdf last random)).
							self addEdge:
							{n1 model . target model}
							from: #first
								to: #second			
						 ]	
					 ] ]
			]
]

{ #category : #running }
MalKleinbergGraphGenerator >> buildUniformDistributionOfLongRangeLinks [
	"Build q long range links for each nodes uniformly distributed"
	"when r == 0"
	nodes
		do:
			[ :each | q timesRepeat: [
				self
						addEdge:
							{each model.
							nodes atRandom model}
							from: #first
								to: #second
				] ]
]

{ #category : #running }
MalKleinbergGraphGenerator >> distanceFrom: aNode1 to: aNode2 [
	| i j k l |
	i := aNode1 x.
	j := aNode1 y.
	k := aNode2 x.
	l := aNode2 y.
	^ (k - i) abs + (l - j) abs
]

{ #category : #configuration }
MalKleinbergGraphGenerator >> edgeClass [
	^ MalGraphEdge
]

{ #category : #initialization }
MalKleinbergGraphGenerator >> initializeNodesOnGrid [
	| nbNodes |
	nbNodes := 1.
	nodes
		do: [ :each | 
			each x: (nbNodes - 1) \\ n + 1.
			each y: (nbNodes - 1 quo: n) + 1.
			nbNodes := nbNodes + 1]
]

{ #category : #accessing }
MalKleinbergGraphGenerator >> n [
	^ n
]

{ #category : #accessing }
MalKleinbergGraphGenerator >> n: anInteger [
	n := anInteger
]

{ #category : #configuration }
MalKleinbergGraphGenerator >> nodeClass [
	^ Mal2DGridNode 
]

{ #category : #running }
MalKleinbergGraphGenerator >> nodesLessThanDistance: aDistance toNode: aNode [
	"Return nodes that are less than distance p to a node"

	| i j k l |
	i := aNode x.
	j := aNode y.
	
^nodes select: [ : each|
		k := each x.
		l := each y.
		 (k-i) abs + (l-j) abs <= aDistance
	 ]
]

{ #category : #accessing }
MalKleinbergGraphGenerator >> p: anInteger [
	p := anInteger
]

{ #category : #accessing }
MalKleinbergGraphGenerator >> q: anInteger [
	"number of long range links for each node"

	q := anInteger
]

{ #category : #accessing }
MalKleinbergGraphGenerator >> r: anInteger [
	r := anInteger
]

{ #category : #running }
MalKleinbergGraphGenerator >> run [
	self initializeNodesOnGrid.
	self buildLocalLinks.
	self buildLongRangeLinks
]
