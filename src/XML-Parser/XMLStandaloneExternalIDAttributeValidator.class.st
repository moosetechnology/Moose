"
This class validates standalone externally defined ID attributes that must have unique (not repeated in the same document) values. It disallows attributes that require further value normalization.
"
Class {
	#name : #XMLStandaloneExternalIDAttributeValidator,
	#superclass : #XMLIDAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalIDAttributeValidator >> isStandaloneExternal [
	^ true
]
