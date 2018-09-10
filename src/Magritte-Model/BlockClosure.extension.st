Extension { #name : #BlockClosure }

{ #category : #'*Magritte-Model' }
BlockClosure >> optionFor: anObject ifPresent: aBlock [
	aBlock value: (self cull: anObject)
]
