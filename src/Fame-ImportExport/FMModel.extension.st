Extension { #name : #FMModel }

{ #category : #'*Fame-ImportExport' }
FMModel >> accept: aParseClient [
	FMRepositoryVisitor new
		model: self;
		printer: aParseClient;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportOn: aStream [
	self accept: (FMMSEPrinter on: aStream)
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportString [

	| printer |
	printer := FMMSEPrinter new onString.	
	self accept: printer.
	^printer stream contents
]

{ #category : #'*Fame-ImportExport' }
FMModel class >> fromString: aString [
	^ self new
		importString: aString;
		yourself
]

{ #category : #'*Fame-ImportExport' }
FMModel >> gtExportAction [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ 
			| fileReference |
			fileReference := UITheme builder fileSave: 'Specify MSE file' extensions: #('mse').
			fileReference ifNotNil: [ 
				fileReference writeStreamDo: [ :s | self exportOn: s ].
				Notification signal: 'Save successful!' ] ];
		icon: (Smalltalk ui icons iconNamed: #glamorousSave);
		title: 'Export to MSE'
	
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importStream: aReadStream [
	(FMImporter model: self)
		stream: aReadStream;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importString: mseString [
	self importStream: mseString readStream
]
