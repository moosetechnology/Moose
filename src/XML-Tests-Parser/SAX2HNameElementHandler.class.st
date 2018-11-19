"
Handler for the sample <person> <name> element.
"
Class {
	#name : #SAX2HNameElementHandler,
	#superclass : #SAX2ElementCharacterHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HNameElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self parser parsingResult name: self characters
]
