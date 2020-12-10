"
An OverviewPyramidTest is a test class for testing the behavior of OverviewPyramid
"
Class {
	#name : #OverviewPyramidTest,
	#superclass : #TestCase,
	#category : #'Moose-RoassalPaintings-Tests-OverviewPyramid'
}

{ #category : #helpers }
OverviewPyramidTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #helpers }
OverviewPyramidTest >> prepareAnyMooseModel [
	| model importer models |
	self timeLimit: 30 seconds.
	models := MooseModel root allModels.
	models ifNotEmpty: [ ^ models anyOne ].
	model := FamixStModel new.
	model name: 'AST'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer
		model: model;
		addFromPackagesNamed: (MooseScripts packageNamesFor: 'AST*');
		runWithProgress.
	^ model
]

{ #category : #tests }
OverviewPyramidTest >> testOpen [

	self
		shouldnt: (OverviewPyramid on: self prepareAnyMooseModel) open delete
		raise: Error
]

{ #category : #tests }
OverviewPyramidTest >> testRectangleSize [
	| pyramid |

	pyramid := OverviewPyramid on: self prepareAnyMooseModel.
	self
		assert:
			(pyramid rectangles
				allSatisfy: [ :rectangle | rectangle extent = PyramidRectangleFactory defaultExtent ])
]

{ #category : #tests }
OverviewPyramidTest >> testoverviewPyramidMetrics [

	self
		assert: (self model overviewPyramidMetrics isKindOf: OverviewPyramidMetrics)
]
