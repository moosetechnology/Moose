"
Handler for the sample <person> element.
"
Class {
	#name : #SAX2HPersonElementHandler,
	#superclass : #SAX2ElementHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HPersonElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self parser parsingResult: SAX2SamplePerson new
]
