Class {
	#name : #MooseSmalltalkImporterRoelTyperTest,
	#superclass : #MooseTestWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterRoelTyperTest >> testASTCore [
	| model importer |
	model := MooseModel new.
	self timeLimit: 60 seconds.
	importer := self newPharoImporterTask.
	importer importingContext
		mergeClassAndMetaclass;
		computeTypeOfAttributes.
	importer runCandidateOperator.
	self
		shouldnt: [ importer
				model: model;
				addFromPackagesNamed: #('AST-Core');
				run ]
		raise: Error.
	self deny: model isEmpty
]
