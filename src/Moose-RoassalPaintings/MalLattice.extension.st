Extension { #name : #MalLattice }

{ #category : #'*Moose-RoassalPaintings' }
MalLattice >> viewLattice: aLattice [
	| view |
	
	view := RTMondrian new.
	self viewLattice: aLattice on: view.
	^ view open
]

{ #category : #'*Moose-RoassalPaintings' }
MalLattice >> viewLattice: aLattice on: view [
	
	view nodes: aLattice nodes.
	view edges connectToAll: #descendants.
	view layout tree.
]
