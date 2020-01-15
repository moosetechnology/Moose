"
Description
--------------------

I am a decoration of a FMImporter that will allow one to filter the kind of entities to import.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	filter:				<aCollection>		A collection of the elements to filter out.
	importer:				<aFMImporter>		The importer I am wrapping.
	shouldSkip:			<aBoolean>			If true, I'll skip the current element.

"
Class {
	#name : #FMImporterFilter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'shouldSkip',
		'filter',
		'importer'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMImporterFilter class >> on: aFMParserClient filtering: aCollectionOfElementNames [
	^ self new
		importer: aFMParserClient;
		filter: aCollectionOfElementNames;
		yourself
]

{ #category : #parsing }
FMImporterFilter >> beginDocument [
	importer beginDocument
]

{ #category : #parsing }
FMImporterFilter >> beginEntity: name [
	(filter includes: name)
		ifTrue: [ shouldSkip := false.
			importer beginEntity: name ]
		ifFalse: [ shouldSkip := true ]
]

{ #category : #parsing }
FMImporterFilter >> beginProperty: name [
	shouldSkip ifFalse: [ importer beginProperty: name ]
]

{ #category : #parsing }
FMImporterFilter >> endDocument [
	importer endDocument
]

{ #category : #parsing }
FMImporterFilter >> endEntity: name [
	shouldSkip ifFalse: [ importer endEntity: name ]
]

{ #category : #parsing }
FMImporterFilter >> endProperty: name [
	shouldSkip ifFalse: [ importer endProperty: name ]
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
	^ self importer fromString: aString
]

{ #category : #accessing }
FMImporterFilter >> importer [
	^ importer
]

{ #category : #accessing }
FMImporterFilter >> importer: aFMImporter [
	"Importer will be we the FMImporter that will execute the concrete operations. This class only provided the filtering aspect"

	importer := aFMImporter
]

{ #category : #accessing }
FMImporterFilter >> index [
	^ self importer index
]

{ #category : #initialization }
FMImporterFilter >> initialize [
	super initialize.
	shouldSkip := false
]

{ #category : #accessing }
FMImporterFilter >> metamodel [
	^ self importer metamodel
]

{ #category : #accessing }
FMImporterFilter >> model [
	^ self importer model
]

{ #category : #accessing }
FMImporterFilter >> model: aModel [
	^ self importer model: aModel
]

{ #category : #parsing }
FMImporterFilter >> primitive: value [
	shouldSkip ifFalse: [ importer primitive: value ]
]

{ #category : #parsing }
FMImporterFilter >> referenceName: name [
	shouldSkip ifFalse: [ importer referenceName: name ]
]

{ #category : #parsing }
FMImporterFilter >> referenceNumber: index [
	shouldSkip ifFalse: [ importer referenceNumber: index ]
]

{ #category : #running }
FMImporterFilter >> run [
	FMMSEParser new
		stream: importer stream;
		importer: self;
		run
]

{ #category : #parsing }
FMImporterFilter >> serial: index [
	shouldSkip ifFalse: [ importer serial: index ]
]

{ #category : #accessing }
FMImporterFilter >> stream [
	^ self importer stream
]

{ #category : #accessing }
FMImporterFilter >> stream: aReadStream [
	^ self importer stream: aReadStream
]
