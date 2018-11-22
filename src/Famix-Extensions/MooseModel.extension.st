Extension { #name : #MooseModel }

{ #category : #'*Famix-Extensions' }
MooseModel >> overviewPyramidMetrics [

	^ self privateState propertyAt: #overviewPyramidMetrics ifAbsentPut: [OverviewPyramidMetrics on: self]
]
