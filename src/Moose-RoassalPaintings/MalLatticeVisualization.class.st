"
I am the visualization for MalLattice.

===========================================

(MalLattice on: MalFormalContext mammals2) openVisualization
"
Class {
	#name : #MalLatticeVisualization,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'lattice'
	],
	#category : #'Moose-RoassalPaintings-Moose-Algos'
}

{ #category : #accessing }
MalLatticeVisualization class >> defaultTitle [
	^ 'Lattice'
]

{ #category : #accessing }
MalLatticeVisualization class >> icon [
	^ MooseIcons mooseCycles
]

{ #category : #'instance creation' }
MalLatticeVisualization class >> on: aLattice [
	^ self new
		lattice: aLattice;
		yourself
]

{ #category : #building }
MalLatticeVisualization >> build [
	self buildNodes.
	self buildEdges.
	self setLayout
]

{ #category : #building }
MalLatticeVisualization >> buildEdges [
	RSEdgeBuilder line
		shapes: canvas nodes;
		connectToAll: #descendants
]

{ #category : #building }
MalLatticeVisualization >> buildNodes [
	canvas
		addAll:
			(lattice nodes
				collect: [ :node | 
					RSCircle new
						model: node;
						draggable;
						popupText: #visualizationLabel;
						yourself ])
]

{ #category : #accessing }
MalLatticeVisualization >> lattice: anObject [
	lattice := anObject
]

{ #category : #building }
MalLatticeVisualization >> setLayout [
	RSTreeLayout new on: canvas nodes
]
