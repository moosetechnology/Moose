"
This class will make sure the value of a standalone externally defined attribute is present (the default value is never used).
"
Class {
	#name : #XMLStandaloneExternalAttributeValueDefaultValidator,
	#superclass : #XMLAttributeValueDefaultValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #private }
XMLStandaloneExternalAttributeValueDefaultValidator >> errorStandaloneExternalAttributeDefaultValueUsed [
	XMLValidationException
		formatSignal:
			'Externally defined attribute "{1}" default value ',
			'cannot be used by elements when standalone="yes"'
		with: self attribute
]

{ #category : #validating }
XMLStandaloneExternalAttributeValueDefaultValidator >> validatedDefaultForAbsentAttributeValue [
	self errorStandaloneExternalAttributeDefaultValueUsed
]
