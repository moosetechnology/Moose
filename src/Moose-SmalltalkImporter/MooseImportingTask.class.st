"
MooseImportingTask defines tasks whose goal is to populate models.

Instance Variables:
	importingContext	<ProtoObject | PseudoContext>
	importerClass	<Behavior>
"
Class {
	#name : #MooseImportingTask,
	#superclass : #MooseAbstractImporter,
	#instVars : [
		'importerClass',
		'factory'
	],
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #accessing }
MooseImportingTask >> defaultImporterClass [
	"By default the class responsible for the extraction of model from Smalltalk code is SmalltalkImporter."
	^ SmalltalkImporter
]

{ #category : #accessing }
MooseImportingTask >> factory [
	^ factory
]

{ #category : #accessing }
MooseImportingTask >> factory: anObject [
	factory := anObject
]

{ #category : #accessing }
MooseImportingTask >> importerClass [
	^ importerClass
]

{ #category : #accessing }
MooseImportingTask >> importerClass: anObject [
	"to specify the importer to be used. Normally you do not have to use this method.
	Only FAMIX20/FAMIX30 code should do that"
	
	importerClass := anObject
]

{ #category : #'initialize-release' }
MooseImportingTask >> initialize [
	super initialize.
	importerClass := self defaultImporterClass
]
