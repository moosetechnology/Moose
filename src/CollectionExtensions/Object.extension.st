Extension { #name : #Object }

{ #category : #'*CollectionExtensions' }
Object >> asCollection [
	^ self asOrderedCollection
]

{ #category : #'*CollectionExtensions' }
Object >> deepFlattenInto: stream [

	stream nextPut: self
]
