Extension { #name : #MalLatticeNode }

{ #category : #'*Moose-RoassalPaintings' }
MalLatticeNode >> visualizationLabel [
	^ String
		streamContents: [ :s | 
			self labels first printElementsOn: s.
			self labels last printElementsOn: s ]
]
