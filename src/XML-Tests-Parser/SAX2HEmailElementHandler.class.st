"
Handler for the sample <person> <contacts> <email> element.
"
Class {
	#name : #SAX2HEmailElementHandler,
	#superclass : #SAX2ElementHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HEmailElementHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self parser parsingResult addEmailAddress: (anAttributeDictionary at: 'address')
]
