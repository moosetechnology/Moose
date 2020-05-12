Extension { #name : #FamixTFileAnchor }

{ #category : #'*Famix-Deprecated' }
FamixTFileAnchor >> hasSourceText [
	self deprecated: 'Use #hasSource instead' transformWith: '`@receiver hasSourceText' -> '`@receiver hasSource'.
	^ self hasSource
]
