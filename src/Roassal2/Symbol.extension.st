Extension { #name : #Symbol }

{ #category : #'*Roassal2-Core' }
Symbol >> rtValue: anObject [ 
	^ anObject perform: self
]
