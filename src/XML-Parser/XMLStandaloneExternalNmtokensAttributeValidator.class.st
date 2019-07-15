"
This class validates standalone externally defined attributes with lists of Nmtoken name values separated by spaces. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalNmtokensAttributeValidator,
	#superclass : #XMLNmtokensAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalNmtokensAttributeValidator >> isStandaloneExternal [
	^ true
]
