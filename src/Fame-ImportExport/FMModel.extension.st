Extension { #name : #FMModel }

{ #category : #'*Fame-ImportExport' }
FMModel >> exportOn: aStream [
	self exportWithPrinter: (FMMSEPrinter on: aStream)
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportString [
	| printer |
	printer := FMMSEPrinter onString.
	self exportWithPrinter: printer.
	^ printer stream contents
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportWithPrinter: aParseClient [
	FMModelExporter new
		model: self;
		printer: aParseClient;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel class >> fromString: aString [
	^ self new
		importString: aString;
		yourself
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
