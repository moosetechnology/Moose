"
This class validates standalone externally defined xml:id ID attributes. It disallows attributes that require further value normalization.
"
Class {
	#name : #XMLStandaloneExternalXMLIDAttributeValidator,
	#superclass : #XMLXMLIDAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalXMLIDAttributeValidator >> isStandaloneExternal [
	^ true
]
