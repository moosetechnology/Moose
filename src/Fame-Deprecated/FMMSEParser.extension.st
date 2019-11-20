Extension { #name : #FMMSEParser }

{ #category : #'*Fame-Deprecated' }
FMMSEParser >> Attribute [
	self deprecated: 'Use #Property instead.' transformWith: '``@object Attribute' -> '``@object Property'.
	^ self Property
]

{ #category : #'*Fame-Deprecated' }
FMMSEParser >> client [
	self deprecated: 'Use #importer instead' transformWith: '`@receiver client' -> '`@receiver importer'.
	^ self importer
]

{ #category : #'*Fame-Deprecated' }
FMMSEParser >> client: parseClient [
	self deprecated: 'Use #importer: instead' transformWith: '`@receiver client: `@arg' -> '`@receiver importer: `@arg'.
	^ self importer: parseClient
]
