Extension { #name : #MalFormalContextTest }

{ #category : #'*Moose-RoassalPaintings-Test' }
MalFormalContextTest >> testViewLattice [

	self shouldnt: [self initializeContext delete] raise: Error.
]
