Extension { #name : #TextFieldPart }

{ #category : #'*Merlin-Rendering' }
TextFieldPart >> merlinRendering [

	^ self renderer merlinTextFieldRenderingFor: self
]
