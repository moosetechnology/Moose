Class {
	#name : #FMParseClientFilter,
	#superclass : #FMParserClient,
	#instVars : [
		'parserClient',
		'filter',
		'shouldSkip'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMParseClientFilter class >> onClient: aFMParserClient withFilter: aCollectionOfElementNames [
	
	^ self new parserClient: aFMParserClient; filter: aCollectionOfElementNames ; yourself .
]

{ #category : #parsing }
FMParseClientFilter >> beginAttribute: name [
	shouldSkip ifFalse: [ parserClient beginAttribute: name ]
]

{ #category : #parsing }
FMParseClientFilter >> beginDocument [
	parserClient beginDocument
]

{ #category : #parsing }
FMParseClientFilter >> beginElement: name [
	(filter includes: name)
		ifTrue: [ shouldSkip := false.
			parserClient beginElement: name ]
		ifFalse: [ shouldSkip := true ]
]

{ #category : #parsing }
FMParseClientFilter >> endAttribute: name [
	shouldSkip ifFalse: [ parserClient endAttribute: name ]
]

{ #category : #parsing }
FMParseClientFilter >> endDocument [
	parserClient endDocument
]

{ #category : #parsing }
FMParseClientFilter >> endElement: name [
	shouldSkip ifFalse: [ parserClient endElement: name ]
]

{ #category : #accessing }
FMParseClientFilter >> filter [
	^ filter
]

{ #category : #accessing }
FMParseClientFilter >> filter: aCollectionOfElementNames [
	"Filter is a collection containing the names of elements that can be imported. When the method #beginElement: is invoked, if the name of the element is not in filter, nothing will be generated. In the opposite case, the work will be delegated to parserClient."

	filter := aCollectionOfElementNames
]

{ #category : #'initialize-release' }
FMParseClientFilter >> initialize [
	super initialize.
	shouldSkip := false
]

{ #category : #accessing }
FMParseClientFilter >> parserClient [
	^ parserClient
]

{ #category : #accessing }
FMParseClientFilter >> parserClient: aFMParserClient [
	"ParserClient will be we the FMParserClient that will execute the concrete operations. This class only provided the filtering aspect"

	parserClient := aFMParserClient
]

{ #category : #parsing }
FMParseClientFilter >> primitive: value [
	shouldSkip ifFalse: [ parserClient primitive: value ]
]

{ #category : #parsing }
FMParseClientFilter >> referenceName: name [
	shouldSkip ifFalse: [ parserClient referenceName: name ]
]

{ #category : #parsing }
FMParseClientFilter >> referenceNumber: index [
	shouldSkip ifFalse: [ parserClient referenceNumber: index ]
]

{ #category : #parsing }
FMParseClientFilter >> serial: index [
	shouldSkip ifFalse: [ parserClient serial: index ]
]
