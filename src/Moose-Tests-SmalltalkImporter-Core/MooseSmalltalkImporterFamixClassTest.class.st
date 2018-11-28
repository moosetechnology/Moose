Class {
	#name : #MooseSmalltalkImporterFamixClassTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterFamixClassTest >> testIsSUnitTestCase [
	| mooseModel |
	mooseModel := MooseModel new.
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		factory: SmalltalkCompatibilityMetamodelFactory;
		model: mooseModel;
		addClasses: (OrderedCollection with: self class);
		run;
		yourself.
	self assert: (mooseModel allModelClasses select: #isInstanceSide) first isSUnitTestCase
]
