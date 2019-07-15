Extension { #name : #DropListPart }

{ #category : #'*merlin-rendering' }
DropListPart >> merlinRendering [

	^ self renderer merlinDropListRenderingFor: self
]
