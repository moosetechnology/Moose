"
Handler for the sample <books> element.
"
Class {
	#name : #SAX2HBooksElementHandler,
	#superclass : #SAX2ElementHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HBooksElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self parser parsingResult: OrderedCollection new
]
