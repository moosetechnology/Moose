"
This class validates standalone externally defined attributes that contain unparsed entity names (that must be declared). It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalEntityAttributeValidator,
	#superclass : #XMLEntityAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalEntityAttributeValidator >> isStandaloneExternal [
	^ true
]
