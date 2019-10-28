Extension { #name : #FMFutureElement }

{ #category : #'*Famix-Deprecated' }
FMFutureElement >> current [
	self deprecated: 'Use #currentAttribute instead' transformWith: '`@receiver current' -> '`@receiver currentAttribute'.
	^ self currentAttribute
]
