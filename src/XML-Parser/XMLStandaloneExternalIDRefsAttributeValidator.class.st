"
This class validates standalone externally defined attributes with lists of ID ref values separated by spaces. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalIDRefsAttributeValidator,
	#superclass : #XMLIDRefsAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalIDRefsAttributeValidator >> isStandaloneExternal [
	^ true
]
