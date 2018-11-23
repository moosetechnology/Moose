Extension { #name : #FMRepository }

{ #category : #'*Fame-ImportExport' }
FMRepository >> accept: aParseClient [

	| visitor |
	visitor := FMRepositoryVisitor new.
	visitor model: self.
	visitor printer: aParseClient.
	visitor run.
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> document: scriptBlock [
	| importer builder |
	importer := FMImporter new.
	importer repository: self.
	builder := self builderClass new.
	builder client: importer.
	builder document: scriptBlock
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

	| importer |
	importer := FMImporter new.
	importer repository: self.
	importer stream: aReadStream.
	importer run.
	self updateCache.	
]

{ #category : #'*Fame-ImportExport' }
FMRepository >> importString: mseString [

	self importStream: mseString readStream.

]
