"
This class validates Nmtoken name attributes.
"
Class {
	#name : #XMLNmtokenAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLNmtokenAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalNmtokenAttributeValidator
]

{ #category : #private }
XMLNmtokenAttributeValidator >> errorInvalidNmtoken: aName [
	XMLValidationException
		formatSignal: 'Invalid Nmtoken name "{1}" in attribute "{2}" of element <{3}>'
		with: aName
		with: self attribute
		with: self element
]

{ #category : #testing }
XMLNmtokenAttributeValidator >> isNmtoken [
	^ true
]

{ #category : #validating }
XMLNmtokenAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	aDefaultValue isXMLNmtoken
		ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]
]

{ #category : #validating }
XMLNmtokenAttributeValidator >> validateAttributeValue: aValue [
	self validateNmtoken: aValue
]

{ #category : #validating }
XMLNmtokenAttributeValidator >> validateNmtoken: aName [
	aName isXMLNmtoken
		ifFalse: [self errorInvalidNmtoken: aName]
]
