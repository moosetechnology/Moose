Extension { #name : #FMMetaModel }

{ #category : #'*Famix-Deprecated' }
FMMetaModel >> at: aString [
	self deprecated: 'Use #packageNamed: instead' transformWith: '`@receiver at: `@arg' -> '`@receiver packageNamed: `@arg'.
	^ self packageNamed: aString
]

{ #category : #'*Famix-Deprecated' }
FMMetaModel class >> fm3 [
	self deprecated: 'Use FMMetaMetaRepository instance instead' transformWith: 'FMMetaRepository fm3' -> 'FMMetaMetaRepository new'.
	^ FMMetaMetaModel new
]
