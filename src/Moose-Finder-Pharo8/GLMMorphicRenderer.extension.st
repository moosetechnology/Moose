Extension { #name : #GLMMorphicRenderer }

{ #category : #'*Moose-Finder-Pharo8' }
GLMMorphicRenderer >> renderAccumulator: aBrowser [
	^ GLMMorphicAccumulatorRenderer render: aBrowser from: self
]
