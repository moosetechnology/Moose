Extension { #name : #FMModel }

{ #category : #'*Famix-Deprecated' }
FMModel >> initialize: aMetamodel [
	self deprecated: 'Use #metamodel: instead' transformWith: '`@receiver initialize: `@arg' -> '`@receiver metamodel: `@arg'.
	metamodel := aMetamodel
]
