Extension { #name : #FMFutureElement }

{ #category : #'*Fame-Deprecated' }
FMFutureElement >> current [
	self deprecated: 'Use #currentProperty instead' transformWith: '`@receiver current' -> '`@receiver currentProperty'.
	^ self currentProperty
]
