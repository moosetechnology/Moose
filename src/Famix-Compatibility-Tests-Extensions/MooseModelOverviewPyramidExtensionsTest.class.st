Class {
	#name : #MooseModelOverviewPyramidExtensionsTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Extensions'
}

{ #category : #util }
MooseModelOverviewPyramidExtensionsTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #tests }
MooseModelOverviewPyramidExtensionsTest >> testoverviewPyramidMetrics [
	self assert: (self model overviewPyramidMetrics isKindOf: OverviewPyramidMetrics)
]
