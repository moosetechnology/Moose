"
This class validates attributes that refer to an ID of another element with a ID attribute.
"
Class {
	#name : #XMLIDRefAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#instVars : [
		'elementIDValidator'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLIDRefAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalIDRefAttributeValidator
]

{ #category : #accessing }
XMLIDRefAttributeValidator >> elementIDValidator [
	^ elementIDValidator
]

{ #category : #initialization }
XMLIDRefAttributeValidator >> initializeWithValidatorsFrom: aValidatorContainer [
	super initializeWithValidatorsFrom: aValidatorContainer.

	elementIDValidator := aValidatorContainer elementIDValidator.
]

{ #category : #testing }
XMLIDRefAttributeValidator >> isIDRef [
	^ true
]

{ #category : #validating }
XMLIDRefAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	aDefaultValue isXMLName
		ifFalse: [self errorInvalidDefaultAttributeValue: aDefaultValue]
]

{ #category : #validating }
XMLIDRefAttributeValidator >> validateAttributeValue: aValue [
	self elementIDValidator
		validateIDReference: aValue
		inAttribute: self attribute
]
