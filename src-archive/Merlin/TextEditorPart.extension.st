Extension { #name : #TextEditorPart }

{ #category : #'*Merlin-Rendering' }
TextEditorPart >> merlinRendering [

	^ self renderer merlinTextEditorRenderingFor: self
]
