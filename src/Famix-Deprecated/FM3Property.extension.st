Extension { #name : #FM3Property }

{ #category : #'*Famix-Deprecated' }
FM3Property >> isComposite [
	self deprecated: 'Use #isChildrenProperty instead' transformWith: '`@receiver isComposite' -> '`@receiver isChildrenProperty'.
	^ self hasOpposite and: [ self opposite isContainer ]
]

{ #category : #'*Famix-Deprecated' }
FM3Property >> setImplementingSelector: arg1 [ 
	self deprecated: 'Use #implementingSelector: instead.' transformWith: '``@object setImplementingSelector: ``@arg1 ' -> '``@object implementingSelector: ``@arg1 '.
	^ self implementingSelector: arg1 
]
