Extension { #name : #MooseOutgoingQueryResult }

{ #category : #'*Famix-Deprecated' }
MooseOutgoingQueryResult >> sourceClasses [
	self deprecated: 'Use #sourcesAtScope: instead' transformWith: '`@receiver sourceClasses' -> '`@receiver sourcesAtScope: FamixTClass'.
	^ self sourcesAtScope: FamixTClass
]
