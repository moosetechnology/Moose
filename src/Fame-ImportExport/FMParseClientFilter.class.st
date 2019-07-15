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
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient beginAttribute: name].
]

{ #category : #parsing }
FMParseClientFilter >> beginDocument [
	
	^ parserClient beginDocument. 
]

{ #category : #parsing }
FMParseClientFilter >> beginElement: name [
	
	(filter includes: name)
		ifTrue: [ 
			shouldSkip := false.
			^ parserClient beginElement: name
		]
		ifFalse: [
			shouldSkip := true.
			^ self.	
		].
]

{ #category : #parsing }
FMParseClientFilter >> endAttribute: name [
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient endAttribute:  name].
]

{ #category : #parsing }
FMParseClientFilter >> endDocument [
	^parserClient endDocument 
]

{ #category : #parsing }
FMParseClientFilter >> endElement: name [
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient endElement:  name].
]

{ #category : #accessing }
FMParseClientFilter >> filter [ 
	"return the value of filter"
	^ filter.
]

{ #category : #accessing }
FMParseClientFilter >> filter: aCollectionOfElementNames [
"set the value of filter. filter is a collection containing the names of elements that can be imported. When the method #beginElement: is invoked, if the name of the element is not in filter, nothing will be generated. In the opposite case, the work will be delegated to parserClient. "

	filter := aCollectionOfElementNames .
]

{ #category : #'initialize-release' }
FMParseClientFilter >> initialize [

	super initialize.
	shouldSkip := false.
]

{ #category : #accessing }
FMParseClientFilter >> parserClient [ 
	"return the value of parserClient "
	^ parserClient.
]

{ #category : #accessing }
FMParseClientFilter >> parserClient: aFMParserClient [ 
	"set the value of parserClient. parserClient will be we the FMParserClient that will execute the concrete operations. This class only provided the filtering aspect"
	
	parserClient := aFMParserClient .
]

{ #category : #parsing }
FMParseClientFilter >> primitive: value [
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient primitive: value].
]

{ #category : #parsing }
FMParseClientFilter >> referenceName: name [
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient referenceName:  name].
]

{ #category : #parsing }
FMParseClientFilter >> referenceNumber: index [
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient referenceNumber:  index].
]

{ #category : #parsing }
FMParseClientFilter >> serial: index [
	
	shouldSkip 
		ifTrue: [ ^self ]
		ifFalse: [^ parserClient serial: index].
]

{ #category : #accessing }
FMParseClientFilter >> shouldSkip [ 
	"is telling if this FMParseClient have to skip the generation of the current element or not"
	
	^ shouldSkip
]
