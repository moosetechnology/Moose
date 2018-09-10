"
Handler for the sample <person> <date-of-birth> element.
"
Class {
	#name : #SAX2HDateOfBirthElementHandler,
	#superclass : #SAX2ElementCharacterHandler,
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #'handling - content' }
SAX2HDateOfBirthElementHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self parser parsingResult dateOfBirth:
		(Date readFrom: self characters readStream)
]
