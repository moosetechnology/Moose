Extension { #name : #MalLattice }

{ #category : #'*Moose-RoassalPaintings' }
MalLattice >> openVisualization [
	^ (MalLatticeVisualization on: self) open
]
