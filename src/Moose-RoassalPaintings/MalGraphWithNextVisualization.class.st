"
I am the default visualization for Moose-Algos graphs which nodes are instances of a subclasses of MalNodeWithNext.

===========================================

| graphReducer |
graphReducer := MalGraphReducer new.
MalGraphFixture complexCycleGraph2: graphReducer.
graphReducer run.
(MalGraphWithNextVisualization on: graphReducer) open
"
Class {
	#name : #MalGraphWithNextVisualization,
	#superclass : #MalGraphVisualization,
	#category : #'Moose-RoassalPaintings-Moose-Algos'
}

{ #category : #building }
MalGraphWithNextVisualization >> buildEdges [
	RSEdgeBuilder arrowedLine
		shapes: canvas nodes;
		withBorderAttachPoint;
		connectToAll: #nextNodes
]
