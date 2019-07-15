Extension { #name : #CompositePart }

{ #category : #'*Merlin-Rendering' }
CompositePart >> merlinRendering [

	^ self renderer merlinMultiPartsRenderingFor: self
]
