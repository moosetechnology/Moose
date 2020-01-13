Extension { #name : #FMFutureEntity }

{ #category : #'*Fame-Deprecated' }
FMFutureEntity >> current [
	self deprecated: 'Use #currentProperty instead' transformWith: '`@receiver current' -> '`@receiver currentProperty'.
	^ self currentProperty
]
