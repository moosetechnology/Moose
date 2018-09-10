"
A MooseCompositeImporterTask is an abstract class which defines the logical steps and the glue between these steps to import entities from a specification (list of packages, classes or categories). 

MooseCompositeImporterTask collects Smalltalk classes, ask the MooseImportClassesTask to create entities and the InstallElementsOperator to populate the moose model. The MooseImportClassesTask will then pass entities to the InstallElementsOperator which will populate the model.

My subclasses specify specific way to identify the Smalltalk classes that should be represented in a model.
"
Class {
	#name : #MooseCompositeImporterTask,
	#superclass : #MooseImportingTask,
	#instVars : [
		'model',
		'candidateOperator',
		'candidateClass',
		'runSelector'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #accessing }
MooseCompositeImporterTask >> allClassExtensions [ 
	 
	^self subclassResponsibility
]

{ #category : #accessing }
MooseCompositeImporterTask >> allClasses [ 
	 
	^self subclassResponsibility
]

{ #category : #running }
MooseCompositeImporterTask >> basicRun [
	| importerTask importer |
	"importerTask applies an import filter definition (context) on a set of classes (allClasses) and yields elements"
	importerTask := MooseImportClassesTask new importerClass: importerClass.
	importerTask importingContext: importingContext.
	importerTask addAll: self allClasses.
	importerTask addAllExtensions: self allClassExtensions.
	importer := importerTask runSelector: runSelector.
	"InstallElementsOperator populates a Moose model with (unary) elements"
	(InstallElementsOperator 
		with: importer
		on: self model) runSelector: runSelector.
	"CandidateListOperator populates a Moose model with (binary) element relations like: methodA invokes methodB"
	candidateOperator ifTrue: [(self candidateClass runOn: self model importer: importer) runSelector: runSelector].
	self model sourceLanguage: importer factory sourceLanguage new.
	^ self model
]

{ #category : #'protected hooks' }
MooseCompositeImporterTask >> candidateClass [
	candidateClass isNil ifTrue: [ candidateClass := CandidateListOperator].
	^ candidateClass 
]

{ #category : #'protected hooks' }
MooseCompositeImporterTask >> candidateClass: anObject [
	"Normally you should not invoke such method. Use run and doNotRunCandidateOperator instead"
	
	candidateClass := anObject
]

{ #category : #setting }
MooseCompositeImporterTask >> doNotRunCandidateOperator [

	candidateOperator := false
]

{ #category : #accessing }
MooseCompositeImporterTask >> initialize [

	super initialize.
	candidateOperator := true.
	runSelector := #run.
	"PackageOrganizerCache refreshSystemCache."
]

{ #category : #accessing }
MooseCompositeImporterTask >> length [ 
	 
	^0	"dummy value since we are a task holder"
]

{ #category : #accessing }
MooseCompositeImporterTask >> model [ 
	 
	^model ifNil: [model := MooseModel new name: self modelName; yourself]
]

{ #category : #accessing }
MooseCompositeImporterTask >> model: mooseModel [ 
	 
	model := mooseModel
]

{ #category : #accessing }
MooseCompositeImporterTask >> modelName [ 
	 "should return a string describing the model based on the imported entities"
	
	^self subclassResponsibility
]

{ #category : #setting }
MooseCompositeImporterTask >> runCandidateOperator [

	candidateOperator := true
]

{ #category : #running }
MooseCompositeImporterTask >> runWithProgress [

	self withProgress.
	self run.
]

{ #category : #running }
MooseCompositeImporterTask >> updateModelName [ 
	 
	self model name: self modelName
]

{ #category : #running }
MooseCompositeImporterTask >> withProgress [

	runSelector := #runWithProgress
]

{ #category : #running }
MooseCompositeImporterTask >> withoutProgress [

	runSelector := #run
]
