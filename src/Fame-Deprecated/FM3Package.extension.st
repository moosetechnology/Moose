Extension { #name : #FM3Package }

{ #category : #'*Fame-Deprecated' }
FM3Package >> at: aString [
	self deprecated: 'Use #classNamed: instead' transformWith: '`@receiver at: `@arg' -> '`@receiver classNamed: `@arg'.
	^ self classNamed: aString
]
