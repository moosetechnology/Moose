"
Handler for the sample <books> <book> element.
"
Class {
	#name : #SAX2HBookElementHandler,
	#superclass : #SAX2ElementHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HBookElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self parser parsingResult addLast: SAX2SampleBook new
]
