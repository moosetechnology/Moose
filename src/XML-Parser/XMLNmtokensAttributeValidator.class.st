"
This class validates attributes with lists of Nmtoken name values separated by spaces.
"
Class {
	#name : #XMLNmtokensAttributeValidator,
	#superclass : #XMLNmtokenAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLNmtokensAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalNmtokensAttributeValidator
]

{ #category : #testing }
XMLNmtokensAttributeValidator >> isNmtokens [
	^ true
]

{ #category : #validating }
XMLNmtokensAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	self
		spaceSeparatedListValuesIn: aDefaultValue
		do: [:each |
			each isXMLNmtoken
				ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]]
]

{ #category : #validating }
XMLNmtokensAttributeValidator >> validateAttributeValue: aValue [
	self
		spaceSeparatedListValuesIn: aValue
		do: [:each | self validateNmtoken: each]
]
