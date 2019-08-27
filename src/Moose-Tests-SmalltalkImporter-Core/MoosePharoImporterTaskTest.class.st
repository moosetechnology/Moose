Class {
	#name : #MoosePharoImporterTaskTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
MoosePharoImporterTaskTest >> testDefaultImporterClass [
	self assert: MoosePharoImporterTask new importerClass equals: SmalltalkImporter
]

{ #category : #tests }
MoosePharoImporterTaskTest >> testDefaultModel [
	self assert: (MoosePharoImporterTask new model isKindOf: MooseModel)
]

{ #category : #tests }
MoosePharoImporterTaskTest >> testImportedModelHasSmalltalkMetamodel [
	| model |
	model := MoosePharoImporterTask new
		factory: SmalltalkMetamodelFactory;
		addFromPackageNamed: 'Moose-Tests-SmalltalkImporter-Core';
		basicRun.
	self assert: model metamodel equals: FamixPharoSmalltalkGenerator metamodel
]
