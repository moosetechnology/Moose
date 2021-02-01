Extension { #name : #MooseModel }

{ #category : #'*Moose-RoassalPaintings-OverviewPyramid' }
MooseModel >> overviewPyramid [
	^ OverviewPyramid forMooseModel: self
]

{ #category : #'*Moose-RoassalPaintings' }
MooseModel >> overviewPyramidMetrics [
	^ self
		cacheAt: #overviewPyramidMetrics
		ifAbsentPut: [ OverviewPyramidMetrics on: self ]
]
