Extension { #name : #FMModel }

{ #category : #'*Famix-Deprecated' }
FMModel >> initialize: aMetamodel [
	self deprecated: 'Use #metamodel: instead' transformWith: '`@receiver initialize: `@arg' -> '`@receiver metamodel: `@arg'.
	metamodel := aMetamodel
]

{ #category : #'*Famix-Deprecated' }
FMModel class >> with: aMetamodel [
	self deprecated: 'Use #withMetamodel: instead' transformWith: '`@receiver with: `@arg' -> '`@receiver withMetamodel: `@arg'.
	self withMetamodel: aMetamodel
]
