Extension { #name : #ListPart }

{ #category : #'*Merlin-Rendering' }
ListPart >> merlinRendering [

	^ self renderer merlinListRenderingFor: self
]
