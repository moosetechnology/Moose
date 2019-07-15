Extension { #name : #Character }

{ #category : #'*grease-core' }
Character >> print: anObject on: aStream [
	aStream nextPut: self
]
