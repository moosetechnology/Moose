Extension { #name : #FMFutureClass }

{ #category : #'*Fame-Deprecated' }
FMFutureClass >> current [
	self deprecated: 'Use #currentProperty instead' transformWith: '`@receiver current' -> '`@receiver currentProperty'.
	^ self currentProperty
]
