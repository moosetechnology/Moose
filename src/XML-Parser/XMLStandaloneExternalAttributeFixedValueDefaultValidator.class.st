"
This class will make sure the value of a standalone externally defined attribute is present and that it matches a fixed default value (the #FIXED constraint).
"
Class {
	#name : #XMLStandaloneExternalAttributeFixedValueDefaultValidator,
	#superclass : #XMLAttributeFixedValueDefaultValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #private }
XMLStandaloneExternalAttributeFixedValueDefaultValidator >> errorStandaloneExternalAttributeDefaultFixedValueUsed [
	XMLValidationException
		formatSignal:
			'Externally defined attribute "{1}" fixed default value ',
			'cannot be used by elements when standalone="yes"'
		with: self attribute
]

{ #category : #validating }
XMLStandaloneExternalAttributeFixedValueDefaultValidator >> validatedDefaultForAbsentAttributeValue [
	self errorStandaloneExternalAttributeDefaultFixedValueUsed
]
