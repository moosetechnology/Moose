Extension { #name : #FMFutureElement }

{ #category : #'*Fame-Deprecated' }
FMFutureElement >> current [
	self deprecated: 'Use #currentAttribute instead' transformWith: '`@receiver current' -> '`@receiver currentAttribute'.
	^ self currentAttribute
]
