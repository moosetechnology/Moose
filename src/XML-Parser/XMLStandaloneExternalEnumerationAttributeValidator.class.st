"
This class validates attributes that can have any value taken from a list like ""(one|two|thee)"". It disallows attributes that require further value normalization or substitution with default or fixed default values.
"
Class {
	#name : #XMLStandaloneExternalEnumerationAttributeValidator,
	#superclass : #XMLEnumerationAttributeValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalEnumerationAttributeValidator >> isStandaloneExternal [
	^ true
]
