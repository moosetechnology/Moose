Class {
	#name : #MooseMorphicTestResource,
	#superclass : #MooseModelTestResourceWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #setup }
MooseMorphicTestResource >> importModel [
	| importer |
	importer := self newPharoImporterTask.
	importer importingContext mergeClassAndMetaclass.
	importer
		runCandidateOperator;
		model: model;
		addFromPackagesNamed: (MooseScripts packageNamesFor: 'Morphic*');
		runWithProgress
]
