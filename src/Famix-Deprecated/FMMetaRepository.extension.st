Extension { #name : #FMMetaRepository }

{ #category : #'*Famix-Deprecated' }
FMMetaRepository >> at: aString [
	self deprecated: 'Use #packageNamed: instead' transformWith: '`@receiver at: `@arg' -> '`@receiver packageNamed: `@arg'.
	^ self packageNamed: aString
]
