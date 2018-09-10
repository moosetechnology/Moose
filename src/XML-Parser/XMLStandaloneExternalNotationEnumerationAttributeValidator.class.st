"
This class validates attributes that can have NOTATION names from a list as values. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalNotationEnumerationAttributeValidator,
	#superclass : #XMLNotationEnumerationAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalNotationEnumerationAttributeValidator >> isStandaloneExternal [
	^ true
]
