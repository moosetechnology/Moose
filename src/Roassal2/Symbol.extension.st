Extension { #name : #Symbol }

{ #category : #'*Roassal2' }
Symbol >> rtValue: anObject [ 
	^ anObject perform: self
]
