"
This class validates standalone externally defined Nmtoken name attributes. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalNmtokenAttributeValidator,
	#superclass : #XMLNmtokenAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalNmtokenAttributeValidator >> isStandaloneExternal [
	^ true
]
