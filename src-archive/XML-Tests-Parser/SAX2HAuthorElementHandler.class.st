"
Handler for the sample <person> <contacts> element.
"
Class {
	#name : #SAX2HAuthorElementHandler,
	#superclass : #SAX2ElementCharacterHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HAuthorElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self parser parsingResult last addAuthor: self characters
]
