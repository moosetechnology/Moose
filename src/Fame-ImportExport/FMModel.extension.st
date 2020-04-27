Extension { #name : #FMModel }

{ #category : #'*Fame-ImportExport' }
FMModel >> exportOn: aStream [
	self exportOn: aStream usingPrinter: FMMSEPrinter
]

{ #category : #'*Fame-ImportExport' }
FMModel >> exportOn: aStream usingPrinter: aPrinter [
	self exportWithPrinter: (aPrinter on: aStream)
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
FMModel class >> fromJSONString: aString [
	^ self new
		importJSONString: aString;
		yourself
]

{ #category : #'*Fame-ImportExport' }
FMModel class >> fromString: aString [
	^ self new
		importString: aString;
		yourself
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importJSONStream: aReadStream [
	(FMImporter model: self)
		stream: aReadStream;
		parser: FMJSONParser;
		run
]

{ #category : #'*Fame-ImportExport' }
FMModel >> importJSONString: mseString [
	self importJSONStream: mseString readStream
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
