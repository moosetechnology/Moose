"
This class validates ID attributes that must have unique (not repeated in the same document) values.
"
Class {
	#name : #XMLIDAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#instVars : [
		'elementIDValidator'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLIDAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalIDAttributeValidator
]

{ #category : #accessing }
XMLIDAttributeValidator >> elementIDValidator [
	^ elementIDValidator
]

{ #category : #accessing }
XMLIDAttributeValidator >> elementIDValidator: anElementIDValidator [
	elementIDValidator := anElementIDValidator
]

{ #category : #private }
XMLIDAttributeValidator >> errorIDAttributeMustBeRequiredOrImplied [
	XMLValidationException
		formatSignal:
			'Attribute "{1}" of element <{2}> is of ID type and must ',
			'be declared #REQUIRED or #IMPLIED'
		with: self attribute
		with: self element
]

{ #category : #initialization }
XMLIDAttributeValidator >> initializeWithValidatorsFrom: aValidatorContainer [
	super initializeWithValidatorsFrom: aValidatorContainer.

	elementIDValidator := aValidatorContainer elementIDValidator.
]

{ #category : #testing }
XMLIDAttributeValidator >> isID [
	^ true
]

{ #category : #validating }
XMLIDAttributeValidator >> validateAttributeDeclaration [
	self elementIDValidator
		validateIDAttribute: self attribute
		forElement: self element.

	super validateAttributeDeclaration.
]

{ #category : #validating }
XMLIDAttributeValidator >> validateAttributeDefaultValue: aDefaultValue [
	self errorIDAttributeMustBeRequiredOrImplied
]

{ #category : #validating }
XMLIDAttributeValidator >> validateAttributeValue: aValue [
	self elementIDValidator
		validateID: aValue
		inAttribute: self attribute
]
