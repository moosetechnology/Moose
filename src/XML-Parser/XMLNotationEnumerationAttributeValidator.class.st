"
This class validates attributes that can have NOTATION names from a list as values.
"
Class {
	#name : #XMLNotationEnumerationAttributeValidator,
	#superclass : #XMLEnumerationAttributeValidator,
	#instVars : [
		'unparedEntityValidator'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLNotationEnumerationAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalNotationEnumerationAttributeValidator
]

{ #category : #initialization }
XMLNotationEnumerationAttributeValidator >> initializeWithValidatorsFrom: aValidatorContainer [
	super initializeWithValidatorsFrom: aValidatorContainer.

	unparedEntityValidator := aValidatorContainer unparsedEntityValidator.
]

{ #category : #testing }
XMLNotationEnumerationAttributeValidator >> isNotationEnumeration [
	^ true
]

{ #category : #accessing }
XMLNotationEnumerationAttributeValidator >> unparsedEntityValidator [
	^ unparedEntityValidator
]

{ #category : #validating }
XMLNotationEnumerationAttributeValidator >> validateAttributeDeclaration [
	self unparsedEntityValidator validateNotationAttributeDeclaration: self.

	super validateAttributeDeclaration.
]

{ #category : #validating }
XMLNotationEnumerationAttributeValidator >> validateXMLSpaceAttributeDeclaration [
	self errorInvalidXMLSpaceAttributeDeclaration
]
