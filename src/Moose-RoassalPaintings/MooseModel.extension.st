Extension { #name : #MooseModel }

{ #category : #'*Moose-RoassalPaintings' }
MooseModel >> overviewPyramidMetrics [
	^ self privateState cacheAt: #overviewPyramidMetrics ifAbsentPut: [ OverviewPyramidMetrics on: self ]
]

{ #category : #'*Moose-RoassalPaintings-OverviewPyramid' }
MooseModel >> viewOverviewPyramid [
	<menuItem: 'Overview Pyramid' category: 'Visualize'>
	(OverviewPyramid on: self) open
]
