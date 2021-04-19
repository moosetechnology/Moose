"
I am the default visualization for Moose-Algos graphs.

===========================================

| graph builder |
builder := MalGraphStructure new
	nodeClass: MalGraphNode;
	edgeClass: MalGraphEdge;
	yourself.
graph := MalGraphFixture complexCycleGraph2: builder.
(MalGraphVisualization on: graph) open
"
Class {
	#name : #MalGraphVisualization,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'graph'
	],
	#category : #'Moose-RoassalPaintings-Moose-Algos'
}

{ #category : #accessing }
MalGraphVisualization class >> defaultTitle [
	^ 'Moose-algos graph'
]

{ #category : #accessing }
MalGraphVisualization class >> icon [
	^ MooseIcons mooseCycles
]

{ #category : #'instance creation' }
MalGraphVisualization class >> on: aGraph [
	^ self new
		graph: aGraph;
		yourself
]

{ #category : #building }
MalGraphVisualization >> build [
	self buildNodes.
	self buildEdges.
	self setLayout.
	super build
]

{ #category : #building }
MalGraphVisualization >> buildEdges [
	canvas
		addAll:
			(graph edges
				collect: [ :edge | 
					RSArrowedLine new
						model: edge;
						from: (canvas nodes detect: [ :node | node model = edge from ]);
						to: (canvas nodes detect: [ :node | node model = edge to ]) ])
]

{ #category : #building }
MalGraphVisualization >> buildLegend [
	"No legend"

	
]

{ #category : #building }
MalGraphVisualization >> buildNodes [
	canvas
		addAll:
			(graph nodes collect:
				[ :node | self shapeForNode: node ])
]

{ #category : #accessing }
MalGraphVisualization >> graph: anObject [
	graph := anObject
]

{ #category : #building }
MalGraphVisualization >> setLayout [
	RSCircleLayout new on: canvas nodes
]

{ #category : #shapes }
MalGraphVisualization >> shapeForNode: node [
	^ RSCircle new
		model: node;
		draggable;
		labeled;
		yourself
]
