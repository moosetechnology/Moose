"
This class validates ID attributes for the xml:id spec.
"
Class {
	#name : #XMLXMLIDAttributeValidator,
	#superclass : #XMLIDAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLXMLIDAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalXMLIDAttributeValidator
]

{ #category : #testing }
XMLXMLIDAttributeValidator >> isXMLID [
	^ true
]

{ #category : #validating }
XMLXMLIDAttributeValidator >> validateAttributeValue: aValue [
	self elementIDValidator validateXMLID: aValue
]

{ #category : #validating }
XMLXMLIDAttributeValidator >> validateXMLIDAttributeDeclaration [

]
