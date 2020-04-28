"
A special ctest class for importing stub methods, because by defualt they are not imported and therefore, we need to have a special setup here
"
Class {
	#name : #ImportStubMethodSpecialTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #running }
ImportStubMethodSpecialTest >> setUp [
	| importingTask |
	importingTask := MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		model: FamixStModel new ;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		yourself.
	importingTask importingContext importSmalltalkStubMethod.
	importingTask run.
	model := importingTask model
]

{ #category : #tests }
ImportStubMethodSpecialTest >> testStubMethodCreation [
	self assert: (model allMethods select: #isStub) notEmpty.
	self assert: model allModelMethods notEmpty.
]
