Class {
	#name : #FMImporterFilter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'shouldSkip',
		'filter',
		'parserClient'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMImporterFilter class >> on: aFMParserClient filtering: aCollectionOfElementNames [
	^ self new
		parserClient: aFMParserClient;
		filter: aCollectionOfElementNames;
		yourself
]

{ #category : #parsing }
FMImporterFilter >> beginDocument [
	parserClient beginDocument
]

{ #category : #parsing }
FMImporterFilter >> beginEntity: name [
	(filter includes: name)
		ifTrue: [ shouldSkip := false.
			parserClient beginEntity: name ]
		ifFalse: [ shouldSkip := true ]
]

{ #category : #parsing }
FMImporterFilter >> beginProperty: name [
	shouldSkip ifFalse: [ parserClient beginProperty: name ]
]

{ #category : #parsing }
FMImporterFilter >> endDocument [
	parserClient endDocument
]

{ #category : #parsing }
FMImporterFilter >> endEntity: name [
	shouldSkip ifFalse: [ parserClient endEntity: name ]
]

{ #category : #parsing }
FMImporterFilter >> endProperty: name [
	shouldSkip ifFalse: [ parserClient endProperty: name ]
]

{ #category : #accessing }
FMImporterFilter >> filter [
	^ filter
]

{ #category : #accessing }
FMImporterFilter >> filter: aCollectionOfElementNames [
	"Filter is a collection containing the names of elements that can be imported. When the method #beginElement: is invoked, if the name of the element is not in filter, nothing will be generated. In the opposite case, the work will be delegated to parserClient."

	filter := aCollectionOfElementNames
]

{ #category : #accessing }
FMImporterFilter >> fromString: aString [
	^ self parserClient fromString: aString
]

{ #category : #accessing }
FMImporterFilter >> index [
	^ self parserClient index
]

{ #category : #initialization }
FMImporterFilter >> initialize [
	super initialize.
	shouldSkip := false
]

{ #category : #accessing }
FMImporterFilter >> metamodel [
	^ self parserClient metamodel
]

{ #category : #accessing }
FMImporterFilter >> model [
	^ self parserClient model
]

{ #category : #accessing }
FMImporterFilter >> model: aModel [
	^ self parserClient model: aModel
]

{ #category : #accessing }
FMImporterFilter >> parserClient [
	^ parserClient
]

{ #category : #accessing }
FMImporterFilter >> parserClient: aFMParserClient [
	"ParserClient will be we the FMParserClient that will execute the concrete operations. This class only provided the filtering aspect"

	parserClient := aFMParserClient
]

{ #category : #parsing }
FMImporterFilter >> primitive: value [
	shouldSkip ifFalse: [ parserClient primitive: value ]
]

{ #category : #parsing }
FMImporterFilter >> referenceName: name [
	shouldSkip ifFalse: [ parserClient referenceName: name ]
]

{ #category : #parsing }
FMImporterFilter >> referenceNumber: index [
	shouldSkip ifFalse: [ parserClient referenceNumber: index ]
]

{ #category : #running }
FMImporterFilter >> run [
	FMMSEParser new
		stream: parserClient stream;
		importer: self;
		run
]

{ #category : #parsing }
FMImporterFilter >> serial: index [
	shouldSkip ifFalse: [ parserClient serial: index ]
]

{ #category : #accessing }
FMImporterFilter >> stream [
	^ self parserClient stream
]

{ #category : #accessing }
FMImporterFilter >> stream: aReadStream [
	^ self parserClient stream: aReadStream
]
