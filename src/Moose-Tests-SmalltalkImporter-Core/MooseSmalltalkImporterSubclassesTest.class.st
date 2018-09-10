Class {
	#name : #MooseSmalltalkImporterSubclassesTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'pharoImporterTask'
	],
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> model [
	^ model
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> model: anObject [
	model := anObject
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> pharoImporterTask [
	^ pharoImporterTask
]

{ #category : #accessing }
MooseSmalltalkImporterSubclassesTest >> pharoImporterTask: anObject [
	pharoImporterTask := anObject
]

{ #category : #running }
MooseSmalltalkImporterSubclassesTest >> setUp [
	super setUp.
	model := MooseModel new.	
	model name: 'Test'.
	model sourceLanguage: FAMIXSmalltalkSourceLanguage new.
	pharoImporterTask := MoosePharoImporterTask new
		importerClass: SmalltalkImporter;
		doNotRunCandidateOperator; 
		importingContext: (MooseImportingContext new 
										importPackage;
										importInheritance;
										importAccess;
										mergeClassAndMetaclass ; yourself).
]

{ #category : #'as yet unclassified' }
MooseSmalltalkImporterSubclassesTest >> testDoNotImportSubClasses [
	self pharoImporterTask
		importingContext:
				(self pharoImporterTask importingContext
						doNotImportSubclasses;
						yourself);
		model: model;
		addFromPackagesMatching: [ :e | e name beginsWith: 'Moose-TestResources-Reference-Core' ];
		run;
		yourself.
	self deny: ((model allClasses collect: #name) includes: 'SubRootModelTwo')
]

{ #category : #'as yet unclassified' }
MooseSmalltalkImporterSubclassesTest >> testImportSubClasses [
self pharoImporterTask
		importingContext:
				(self pharoImporterTask importingContext
						importSubclasses;
						yourself);
		model: model;
		addFromPackagesMatching: [ :e | e name beginsWith: 'Moose-TestResources-Reference-Core' ];
		run;
		yourself.
	self assert: ((model allClasses collect: #name) includes: 'SubRootModelTwo')
]
