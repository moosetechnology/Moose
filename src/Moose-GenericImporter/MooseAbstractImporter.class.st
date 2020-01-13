"
I'm the root for the new importer.
This way my subclasses share error logging and importerContext
"
Class {
	#name : #MooseAbstractImporter,
	#superclass : #MooseTask,
	#instVars : [
		'importingContext',
		'loggingStream',
		'targetModel'
	],
	#category : #'Moose-GenericImporter-Importers'
}

{ #category : #public }
MooseAbstractImporter class >> run [
	^ self new run
]

{ #category : #public }
MooseAbstractImporter class >> targetModel: aMooseModel [
	"Create an instance of myself and assign the target model. This model is filled up during the import"

	^ self new targetModel: aMooseModel; yourself
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> closeLog [
	Transcript == self errorLog ifFalse: [ self errorLog close ]
]

{ #category : #accessing }
MooseAbstractImporter >> defaultImportingContext [
	^ MooseImportingContext new importMaximum
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> errorLog [ 
	 
	^ loggingStream
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> errorLog: aStream [ 

	loggingStream := aStream
	 

]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> errorLogFileNamed: aString [ 

	self errorLog: (FileSystem disk referenceTo: aString) writeStream
]

{ #category : #accessing }
MooseAbstractImporter >> importingContext [
	^ importingContext
]

{ #category : #accessing }
MooseAbstractImporter >> importingContext: anObject [
	importingContext := anObject
]

{ #category : #'initialize-release' }
MooseAbstractImporter >> initialize [
	super initialize.
	targetModel := MooseModel new.
	importingContext := self defaultImportingContext
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> logFileSuffix [ 
	 
	^'.log'
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> logInitialize [ 
	 
	self errorLog: Transcript
]

{ #category : #model }
MooseAbstractImporter >> targetModel [ 
	 
	^targetModel
]

{ #category : #model }
MooseAbstractImporter >> targetModel: anObject [ 
	 
	targetModel := anObject
]

{ #category : #'Moose deprecated' }
MooseAbstractImporter >> writeLog: aString [
	self errorLog
		nextPutAll: aString;
		cr
]
