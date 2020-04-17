Extension { #name : #FamixTMultipleFileAnchor }

{ #category : #'*Famix-Deprecated' }
FamixTMultipleFileAnchor >> allFiles [
	self deprecated: 'Use fileAnchors instead' transformWith: '`@receiver allFiles' -> '`@receiver fileAnchors'.
	^ self fileAnchors
]

{ #category : #'*Famix-Deprecated' }
FamixTMultipleFileAnchor >> allFiles: anObject [
	self deprecated: 'Use #fileAnchors: instead' transformWith: '`@receiver allFiles: `@arg' -> '`@receiver fileAnchors: `@arg'.
	self fileAnchors: anObject
]
