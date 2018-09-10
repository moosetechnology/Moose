Extension { #name : #Dictionary }

{ #category : #'*Magritte-Model' }
Dictionary >> optionFor: anObject ifPresent: aBlock [
	self at: anObject ifPresent: aBlock

]
