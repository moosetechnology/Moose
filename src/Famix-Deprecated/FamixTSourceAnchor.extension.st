Extension { #name : #FamixTSourceAnchor }

{ #category : #'*Famix-Deprecated' }
FamixTSourceAnchor >> isFile [
	self deprecated: 'Use #isFileAnchor instead' transformWith: '`@receiver isFile' -> '`@receiver isFileAnchor'.
	^ self isFileAnchor
]
