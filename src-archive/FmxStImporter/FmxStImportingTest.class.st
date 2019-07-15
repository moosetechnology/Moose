Class {
	#name : #FmxStImportingTest,
	#superclass : #TestCase,
	#instVars : [
		'importerTask',
		'model'
	],
	#category : #FmxStImporter
}

{ #category : #initialization }
FmxStImportingTest >> setUp [

	super setUp.
	
	model := MooseModel new.
	model metamodel: MiniSmalltalkGenerator metamodel.
	importerTask := MoosePharoImporterTask new.
	importerTask importingContext: (MooseImportingContext new 
		importPackage; 
		importClass;
		importNamespace;
		importMethod;
		importInheritance;
		yourself).
	importerTask importerClass: FmxStImporter.
	importerTask 
		model: model;
		addFromPackagesNamed: #('AST-Core');
		runWithProgress.
	model.
	
]

{ #category : #tests }
FmxStImportingTest >> testBasicImport [

	self assert: model entities notEmpty
]
