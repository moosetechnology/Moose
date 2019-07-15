Extension { #name : #PPEndOfFileParser }

{ #category : #'*PetitGui' }
PPEndOfFileParser >> exampleOn: aStream [ 
	aStream nextPutAll: #'end-of-input'
]
