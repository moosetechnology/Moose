Extension { #name : #FMRepository }

{ #category : #'*Fame-ImportExport' }
FMRepository >> accept: aParseClient [
	FMRepositoryVisitor new
		model: self;
		printer: aParseClient;
		run
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> exportOn: aStream [
	self accept: (FMMSEPrinter on: aStream)
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> exportString [

	| printer |
	printer := FMMSEPrinter new onString.	
	self accept: printer.
	^printer stream contents
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> gtExportAction [
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
FMRepository >> importStream: aReadStream [
	(FMImporter repository: self)
		stream: aReadStream;
		run
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> importString: mseString [
	self importStream: mseString readStream
]
