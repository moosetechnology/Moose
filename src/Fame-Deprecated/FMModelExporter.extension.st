Extension { #name : #FMModelExporter }

{ #category : #'*Fame-Deprecated' }
FMModelExporter >> exportElement: arg1 [ 
	self deprecated: 'Use #exportEntity: instead.' transformWith: '``@object exportElement: ``@arg1 ' -> '``@object exportEntity: ``@arg1 '.
	^ self exportEntity: arg1 
]
