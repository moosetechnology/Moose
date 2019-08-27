Extension { #name : #MooseGroup }

{ #category : #'*Famix-Deprecated' }
MooseGroup >> selectByExpression: anExpression [
	self deprecated: 'Use #select: instead' transformWith: '`@receiver selectByExpression: `@statements1' -> '`@receiver select: `@statements1'.
	^ self select: anExpression
]
