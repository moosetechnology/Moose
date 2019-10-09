Class {
	#name : #MooseSmalltalkImporterRoelTyperTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterRoelTyperTest >> testASTCore [
	| model importer |
	model := FamixStModel new.
	self timeLimit: 60 seconds.
	importer := MoosePharoImporterTask new.
	importer importingContext
		mergeClassAndMetaclass";
		computeTypeOfAttributes".
	importer runCandidateOperator.
	self
		shouldnt: [ importer
				model: model;
				addFromPackagesNamed: #('AST-Core');
				run ]
		raise: Error.
	self deny: model isEmpty
]
