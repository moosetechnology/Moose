Extension { #name : #ButtonPart }

{ #category : #'*Merlin-Rendering' }
ButtonPart >> merlinRendering [ 

	^ self renderer merlinButtonRenderingFor: self  
]
