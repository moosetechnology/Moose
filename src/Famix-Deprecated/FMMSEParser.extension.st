Extension { #name : #FMMSEParser }

{ #category : #'*Famix-Deprecated' }
FMMSEParser >> client [
	self deprecated: 'Use #importer instead' transformWith: '`@receiver client' -> '`@receiver importer'.
	^ self importer
]

{ #category : #'*Famix-Deprecated' }
FMMSEParser >> client: parseClient [
	self deprecated: 'Use #importer: instead' transformWith: '`@receiver client: `@arg' -> '`@receiver importer: `@arg'.
	^ self importer: parseClient
]
