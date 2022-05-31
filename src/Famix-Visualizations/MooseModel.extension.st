Extension { #name : #MooseModel }

{ #category : #'*Famix-Visualizations' }
MooseModel >> overviewPyramid [

	^ OverviewPyramid forMooseModel: self
]

{ #category : #'*Famix-Visualizations' }
MooseModel >> overviewPyramidMetrics [

	^ self
		  cacheAt: #overviewPyramidMetrics
		  ifAbsentPut: [ OverviewPyramidMetrics on: self ]
]
