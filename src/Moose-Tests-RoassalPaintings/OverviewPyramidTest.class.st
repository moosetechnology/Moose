"
An OverviewPyramidTest is a test class for testing the behavior of OverviewPyramid
"
Class {
	#name : #OverviewPyramidTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-RoassalPaintings-OverviewPyramid'
}

{ #category : #tests }
OverviewPyramidTest >> prepareAnyMooseModel [

	| model importer models |
	
	models := MooseModel root allModels.
	models notEmpty ifTrue: [ ^ models anyOne ].
	model := MooseModel new.
	model name: 'AST'.
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: (MooseScripts packageNamesFor: 'AST*'); runWithProgress.
	^ model.
]

{ #category : #tests }
OverviewPyramidTest >> testOpen [

	| model |
	model := self prepareAnyMooseModel.
	self shouldnt: (OverviewPyramid on: model) open delete raise: Error.
]
