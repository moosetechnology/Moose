Class {
	#name : #MooseSmalltalkImporterRoelTyperTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterRoelTyperTest >> testASTCore [
	| model importer |
	model := MooseModel new.
	importer := MoosePharoImporterTask new.
	importer importingContext 
		mergeClassAndMetaclass.
	importer runCandidateOperator.
	self 
		shouldnt: [ importer model: model; 
						addFromPackagesNamed: #('AST-Core');
						run]
		raise: Error.
	self assert: model isEmpty not
	
]
