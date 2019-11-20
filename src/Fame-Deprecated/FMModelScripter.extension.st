Extension { #name : #FMModelScripter }

{ #category : #'*Fame-Deprecated' }
FMModelScripter >> attribute: arg1 with: arg2 [ 
	self deprecated: 'Use #property:with: instead.' transformWith: '``@object attribute: ``@arg1 with: ``@arg2 ' -> '``@object property: ``@arg1 with: ``@arg2 '.
	^ self property: arg1 with: arg2 
]
