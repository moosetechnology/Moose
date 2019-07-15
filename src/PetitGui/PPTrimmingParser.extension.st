Extension { #name : #PPTrimmingParser }

{ #category : #'*PetitGui' }
PPTrimmingParser >> exampleOn: aStream [
	super exampleOn: aStream.
	aStream nextPut: Character space
]
