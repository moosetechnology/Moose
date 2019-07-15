"
This class validates attributes with lists of ID ref values separated by spaces.
"
Class {
	#name : #XMLIDRefsAttributeValidator,
	#superclass : #XMLIDRefAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLIDRefsAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalIDRefsAttributeValidator
]

{ #category : #testing }
XMLIDRefsAttributeValidator >> isIDRefs [
	^ true
]

{ #category : #validating }
XMLIDRefsAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	self
		spaceSeparatedListValuesIn: aDefaultValue
		do: [:each |
			each isXMLName
				ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]]
]

{ #category : #validating }
XMLIDRefsAttributeValidator >> validateAttributeValue: aValue [
	self
		spaceSeparatedListValuesIn: aValue
		do: [:each |
			self elementIDValidator
				validateIDReference: each
				inAttribute: self attribute]
]
