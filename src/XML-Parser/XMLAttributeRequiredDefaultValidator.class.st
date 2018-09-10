"
This class makes sure an attribute is present (the #REQUIRED constrant).
"
Class {
	#name : #XMLAttributeRequiredDefaultValidator,
	#superclass : #XMLAttributeDefaultValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #private }
XMLAttributeRequiredDefaultValidator >> errorRequiredAttributeMissing [
	XMLValidationException
		formatSignal: 'Required attribute "{1}" is missing'
		with: self attribute
]

{ #category : #testing }
XMLAttributeRequiredDefaultValidator >> isRequired [
	^ true
]

{ #category : #validating }
XMLAttributeRequiredDefaultValidator >> validatedDefaultForAbsentAttributeValue [
	self errorRequiredAttributeMissing
]
