"
This class validates standalone externally defined elements with element content that cannot have whitespace between elements unlike the superclass.
"
Class {
	#name : #XMLStandaloneExternalDFAElementContentElementValidator,
	#superclass : #XMLDFAElementContentElementValidator,
	#category : #'XML-Parser-Validation-Standalone'
}

{ #category : #testing }
XMLStandaloneExternalDFAElementContentElementValidator >> ignoresWhitespace [
	^ false
]
