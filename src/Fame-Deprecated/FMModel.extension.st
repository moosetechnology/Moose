Extension { #name : #FMModel }

{ #category : #'*Fame-Deprecated' }
FMModel >> initialize: aMetamodel [
	self deprecated: 'Use #metamodel: instead' transformWith: '`@receiver initialize: `@arg' -> '`@receiver metamodel: `@arg'.
	metamodel := aMetamodel
]

{ #category : #'*Fame-Deprecated' }
FMModel class >> with: aMetamodel [
	self deprecated: 'Use #withMetamodel: instead' transformWith: '`@receiver with: `@arg' -> '`@receiver withMetamodel: `@arg'.
	self withMetamodel: aMetamodel
]
