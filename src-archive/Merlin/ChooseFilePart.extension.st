Extension { #name : #ChooseFilePart }

{ #category : #'*Merlin-Rendering' }
ChooseFilePart >> merlinRendering [

	^ self renderer merlinChooseFileRenderingFor: self
]
