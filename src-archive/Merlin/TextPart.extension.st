Extension { #name : #TextPart }

{ #category : #'*Merlin-Rendering' }
TextPart >> merlinRendering [

	^ self renderer merlinTextRenderingFor: self.
]
