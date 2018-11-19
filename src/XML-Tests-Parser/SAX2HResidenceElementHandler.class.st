"
Handler for the sample <person> <residence> element.
"
Class {
	#name : #SAX2HResidenceElementHandler,
	#superclass : #SAX2ElementCharacterHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HResidenceElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self parser parsingResult residence: self characters
]
