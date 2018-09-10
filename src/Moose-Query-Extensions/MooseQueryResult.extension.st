Extension { #name : #MooseQueryResult }

{ #category : #'*Moose-Query-Extensions' }
MooseQueryResult >> atNamespaceScope [
	self deprecated: 'Use #atScope: FamixTNamespace instead' on: '19/05/2016' in: 'Moose6.1' transformWith: '`@receiver atNamespaceScope' -> '`@receiver atScope: FamixTNamespace'.
	^ self atScope: FamixTNamespace
]

{ #category : #'*Moose-Query-Extensions' }
MooseQueryResult >> atPackageScope [
	self deprecated: 'Use #atScope: FAMIXPackage instead' on: '19/05/2016' in: 'Moose6.1' transformWith: '`@receiver atPackageScope' -> '`@receiver atScope: FamixTPackage'.
	^ self atScope: FamixTPackage 
]

{ #category : #'*Moose-Query-Extensions' }
MooseQueryResult >> atTypeScope [
	self deprecated: 'Use #atScope: FamixTType instead' on: '19/05/2016' in: 'Moose6.1' transformWith: '`@receiver atTypeScope' -> '`@receiver atScope: FamixTType'.
	^ self atScope: FamixTType 
]
