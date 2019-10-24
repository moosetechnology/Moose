Extension { #name : #FMRepository }

{ #category : #'*Famix-Deprecated' }
FMRepository >> initialize: aMetamodel [
	self deprecated: 'Use #metamodel: instead' transformWith: '`@receiver initialize: `@arg' -> '`@receiver metamodel: `@arg'.
	metamodel := aMetamodel
]
