"
This class validates attributes with lists of unparsed entity name values (that must be declared) separated by spaces.
"
Class {
	#name : #XMLEntitiesAttributeValidator,
	#superclass : #XMLEntityAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLEntitiesAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalEntitiesAttributeValidator
]

{ #category : #testing }
XMLEntitiesAttributeValidator >> isEntities [
	^ true
]

{ #category : #validating }
XMLEntitiesAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	self
		spaceSeparatedListValuesIn: aDefaultValue
		do: [:each |
			each isXMLName
				ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]]
]

{ #category : #validating }
XMLEntitiesAttributeValidator >> validateAttributeValue: aValue [
	self
		spaceSeparatedListValuesIn: aValue
		do: [:each |
			self unparsedEntityValidator
				validateEntityReference: each
				inAttribute: self attribute]
]
