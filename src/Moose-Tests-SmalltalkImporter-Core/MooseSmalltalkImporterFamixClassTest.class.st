Class {
	#name : #MooseSmalltalkImporterFamixClassTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MooseSmalltalkImporterFamixClassTest >> testIsTestCase [
	| mooseModel |
	mooseModel := FamixStModel new.
	MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: mooseModel;
		addClasses: (OrderedCollection with: self class);
		run;
		yourself.
	self assert: (mooseModel allModelClasses select: #isInstanceSide) first isTestCase
]
