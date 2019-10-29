Extension { #name : #TDependencyQueryResult }

{ #category : #'*Famix-Deprecated' }
TDependencyQueryResult >> sourceMethods [
	self deprecated: 'Use #sources instead' transformWith: '`@receiver sourceMethods' -> '`@receiver sources'.
	^ self collectAsSet: #from
]
