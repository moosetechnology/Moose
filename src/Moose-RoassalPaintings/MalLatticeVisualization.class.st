"
I am the visualization for MalLattice.

===========================================

(MalLattice on: MalFormalContext mammals2) openVisualization
"
Class {
	#name : #MalLatticeVisualization,
	#superclass : #MalGraphVisualization,
	#category : #'Moose-RoassalPaintings-Moose-Algos'
}

{ #category : #building }
MalLatticeVisualization >> buildEdges [
	RSEdgeBuilder line
		shapes: canvas nodes;
		connectToAll: #descendants
]

{ #category : #shapes }
MalLatticeVisualization >> shapeForNode: node [
	^ RSCircle new
		model: node;
		draggable;
		popupText: #visualizationLabel;
		yourself
]
