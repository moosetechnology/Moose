"
This class validates standalone externally defined attributes with lists of unparsed entity name values (that must be declared) separated by spaces. It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalEntitiesAttributeValidator,
	#superclass : #XMLEntitiesAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalEntitiesAttributeValidator >> isStandaloneExternal [
	^ true
]
