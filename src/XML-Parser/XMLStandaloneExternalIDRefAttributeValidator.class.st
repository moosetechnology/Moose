"
This class validates standalone externally defined attributes that refer to an ID of another element with an ID attribute. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalIDRefAttributeValidator,
	#superclass : #XMLIDRefAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalIDRefAttributeValidator >> isStandaloneExternal [
	^ true
]
