"
This class validates attributes that contain unparsed entity names (that must be declared).
"
Class {
	#name : #XMLEntityAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#instVars : [
		'unparsedEntityValidator'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLEntityAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalEntityAttributeValidator
]

{ #category : #initialization }
XMLEntityAttributeValidator >> initializeWithValidatorsFrom: aValidatorContainer [
	super initializeWithValidatorsFrom: aValidatorContainer.

	unparsedEntityValidator := aValidatorContainer unparsedEntityValidator
]

{ #category : #testing }
XMLEntityAttributeValidator >> isEntity [
	^ true
]

{ #category : #accessing }
XMLEntityAttributeValidator >> unparsedEntityValidator [
	^ unparsedEntityValidator
]

{ #category : #validating }
XMLEntityAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	aDefaultValue isXMLName
		ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]
]

{ #category : #validating }
XMLEntityAttributeValidator >> validateAttributeValue: aValue [
	self unparsedEntityValidator
		validateEntityReference: aValue
		inAttribute: self attribute
]
