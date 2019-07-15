"
This class validates CDATA attributes, which are not whitespace-normalized further.
"
Class {
	#name : #XMLCDataAttributeValidator,
	#superclass : #XMLAttributeValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #defaults }
XMLCDataAttributeValidator class >> standaloneExternalClass [
	^ XMLStandaloneExternalCDataAttributeValidator
]

{ #category : #testing }
XMLCDataAttributeValidator >> isCData [
	^ true
]

{ #category : #testing }
XMLCDataAttributeValidator >> mustFurtherNormalizeAttributeValue [
	^ false
]
