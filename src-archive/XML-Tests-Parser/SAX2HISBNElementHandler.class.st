"
Handler for the sample <books> <book> <isbn> element.
"
Class {
	#name : #SAX2HISBNElementHandler,
	#superclass : #SAX2ElementCharacterHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HISBNElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self parser parsingResult last isbn: self characters
]
