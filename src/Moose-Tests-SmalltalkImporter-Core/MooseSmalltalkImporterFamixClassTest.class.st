Class {
	#name : #MooseSmalltalkImporterFamixClassTest,
	#superclass : #MooseTestWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterFamixClassTest >> testIsSUnitTestCase [
	| mooseModel |
	mooseModel := MooseModel new.
	self newPharoImporterTask 
		importerClass: SmalltalkImporter;
		model: mooseModel;
		addClasses: (OrderedCollection with: self class);
		run;
		yourself.
	self assert: (mooseModel allModelClasses select: #isInstanceSide) first isSUnitTestCase
]
