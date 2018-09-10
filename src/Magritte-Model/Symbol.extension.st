Extension { #name : #Symbol }

{ #category : #'*Magritte-Model' }
Symbol >> asAccessor [
	^ MASelectorAccessor selector: self
]

{ #category : #'*Magritte-Model' }
Symbol >> optionFor: anObject ifPresent: aBlock [
	aBlock value: (anObject perform: self)
]
