Class {
	#name : #FMXMLPrinter,
	#superclass : #FMPrintClient,
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMXMLPrinter class >> new [
	"Answer a newly created and initialized instance."

	^super new initialize
]

{ #category : #parsing }
FMXMLPrinter >> beginAttribute: name [

	stream nextPut: $>.
	indent := indent + 1.
	self crTabs.
	stream 
		nextPutAll: '<Attribute name="';
		nextPutAll: name;
		nextPut: $"
]

{ #category : #parsing }
FMXMLPrinter >> beginDocument [
	
	stream nextPutAll: '<?xml version="1.0"?>'.
	self crTabs.
	stream nextPutAll: '<Document'.
]

{ #category : #parsing }
FMXMLPrinter >> beginElement: name [

	stream nextPut: $>.
	indent := indent + 1.
	self crTabs.
	stream 
		nextPutAll: '<Element name="';
		nextPutAll: name;
		nextPutAll: '"'
]

{ #category : #parsing }
FMXMLPrinter >> endAttribute: name [

	stream nextPut: $>.
	self crTabs.
	stream 
		nextPutAll: '</Attribute'.
	indent := indent - 1.
]

{ #category : #parsing }
FMXMLPrinter >> endDocument [
	
	stream nextPut: $>.
	self crTabs.
	stream nextPutAll: '</Document>'
]

{ #category : #parsing }
FMXMLPrinter >> endElement: name [

	stream nextPut: $>.
	self crTabs.
	stream 
		nextPutAll: '</Element'.
	indent := indent - 1.
]

{ #category : #'initialize-release' }
FMXMLPrinter >> initialize [
	stream := nil.
	indent := nil.
	^self
]

{ #category : #parsing }
FMXMLPrinter >> primitive: value [

	stream nextPut: $>.
	indent := indent + 1.
	self crTabs.
	(value isKindOf: Boolean) ifTrue: [
		stream 
			nextPutAll: '<Boolean value="';
			print: value;
			nextPut: $";
			nextPut: $/ ] ifFalse: [
	(value isKindOf: String) ifTrue: [
		stream nextPutAll: '<String value="'.
		value do: [ :char | | charToPrint |
			$" == char ifTrue: [ 
				stream nextPut: $\ ].
			Character cr == char ifTrue: [
				stream nextPut: $\.
				charToPrint := $n ].
			Character tab == char ifTrue: [
				stream nextPut: $\.
				charToPrint := $t ].
			stream nextPut: (charToPrint ifNil: [ char ] ) ].
		stream
			nextPut: $";
			nextPut: $/ ] ifFalse: [
	(value isKindOf: Number) ifTrue: [
		stream 
			nextPutAll: '<Number value="';
			print: value;
			nextPut: $";
			nextPut: $/ ] ifFalse: [ Error signal ]]].
	indent := indent - 1.
]

{ #category : #parsing }
FMXMLPrinter >> referenceName: name [

	stream nextPut: $>.
	indent := indent + 1.
	self crTabs.
	stream 
		nextPutAll: '<ExternalReference name="';
		nextPutAll: name;
		nextPut: $";
		nextPut: $/.
	indent := indent - 1.
]

{ #category : #parsing }
FMXMLPrinter >> referenceNumber: index [

	stream nextPut: $>.
	indent := indent + 1.
	self crTabs.
	stream 
		nextPutAll: '<Value idref="';
		print: index;
		nextPut: $";
		nextPut: $/.
	indent := indent - 1.
]

{ #category : #parsing }
FMXMLPrinter >> serial: index [
	
	stream 
		space;
		nextPutAll: 'id="';
		print: index;
		nextPut: $"
]
