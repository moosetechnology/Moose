Extension { #name : #Stream }

{ #category : #'*PetitParser' }
Stream >> asPetitStream [
	^ self contents asPetitStream
]
