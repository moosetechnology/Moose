Class {
	#name : #SmaCCRewriteEngineCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'failingFiles',
		'doneCount',
		'totalCount',
		'doneSemaphore'
	],
	#category : #'SmaCC_Rewrite_Engine_Command_Line'
}

{ #category : #accessing }
SmaCCRewriteEngineCommandLineHandler class >> commandName [
	^ 'SmaCCTransformationRunner'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> activate [
	self configurationFilename ifNotNil: [ :filename | ^ self runFile: filename ].
	self exitFailure: 'Please provide rewrite file to run: --file=filename.rwc'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> configurationFilename [
	^ self optionAt: 'file' ifAbsent: [ self arguments detect: [ :each | each first ~= '-' ] ifNone: [ nil ] ]
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> finished: aSmaCCRewriteResult [
	doneCount := doneCount + 1.
	(aSmaCCRewriteResult isError or: [ aSmaCCRewriteResult isWarning ])
		ifTrue: [ failingFiles := failingFiles + 1.
			FileStream stderr
				nextPutAll: aSmaCCRewriteResult filename;
				nextPutAll: ': ';
				nextPutAll: aSmaCCRewriteResult errorString;
				nextPutAll: String crlf ].
	totalCount = doneCount
		ifTrue: [ doneSemaphore signal ]
]

{ #category : #testing }
SmaCCRewriteEngineCommandLineHandler >> isLocal [
	^ self hasOption: 'local'
]

{ #category : #testing }
SmaCCRewriteEngineCommandLineHandler >> isServer [
	^ self hasOption: 'server'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> run: aSmaCCTransformationToolkitModel [
	failingFiles := 0.
	doneCount := 0.
	totalCount := aSmaCCTransformationToolkitModel files size.
	totalCount = 0
		ifTrue: [ self stderr
				nextPutAll: 'No files specified';
				cr.
			self exitSuccess ].
	doneSemaphore := Semaphore new.
	aSmaCCTransformationToolkitModel addDependent: self.
	aSmaCCTransformationToolkitModel perform: self runType with: aSmaCCTransformationToolkitModel files.
	doneSemaphore wait.
	self shouldTerminateServer
		ifTrue: [ aSmaCCTransformationToolkitModel terminateServer ].
	^ (Exit status: failingFiles) signal
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> runFile: aString [
	| model |
	model := SmaCCTransformationToolkitModel new.
	[ model loadFile: aString ]
		on: Error
		do: [ :ex | ^ self exitFailure: 'Unable to load file: ' , aString ].
	self run: model
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> runType [
	self isLocal
		ifTrue: [ ^ #localRunOn: ].
	self isServer
		ifTrue: [ ^ #localRunOn: ].
	^ #runOn:
]

{ #category : #testing }
SmaCCRewriteEngineCommandLineHandler >> shouldTerminateServer [
	^ self hasOption: 'terminate'
]

{ #category : #activation }
SmaCCRewriteEngineCommandLineHandler >> update: aSymbol with: anObject [
	aSymbol = #resultAdded
		ifTrue: [ ^ self finished: anObject ].
	super update: aSymbol with: anObject
]
