Extension { #name : #MalHits }

{ #category : #'*Moose-RoassalPaintings-displaying' }
MalHits >> openVisualization [
	^ (MalGraphWithNextVisualization on: self) open
]
