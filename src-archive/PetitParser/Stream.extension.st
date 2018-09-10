Extension { #name : #Stream }

{ #category : #'*petitparser-core-converting' }
Stream >> asPetitStream [
	^ self contents asPetitStream
]
