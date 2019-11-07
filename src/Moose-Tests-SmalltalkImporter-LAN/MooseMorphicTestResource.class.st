Class {
	#name : #MooseMorphicTestResource,
	#superclass : #SmalltalkModelTestResource,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #setup }
MooseMorphicTestResource >> importModel [
	| importer |
	importer := MoosePharoImporterTask new.
	importer importingContext mergeClassAndMetaclass.
	importer
		runCandidateOperator;
		model: model;
		addFromPackagesNamed: (MooseScripts packageNamesFor: 'Morphic*');
		runWithProgress
]
