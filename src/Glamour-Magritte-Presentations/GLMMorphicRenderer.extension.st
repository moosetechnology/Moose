Extension { #name : #GLMMorphicRenderer }

{ #category : #'*Glamour-Magritte-Presentations' }
GLMMorphicRenderer >> renderMagrittePresentation: aMagrittePresentation [ 
	^ GLMMorphicMagritteRenderer render: aMagrittePresentation from: self
]
