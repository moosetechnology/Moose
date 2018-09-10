"
A state for internal subset tokens.
"
Class {
	#name : #XMLInternalSubsetState,
	#superclass : #XMLDoctypeDeclarationState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #testing }
XMLInternalSubsetState >> isInternalSubsetState [
	^ true
]

{ #category : #tokenizing }
XMLInternalSubsetState >> nextTokenFrom: aTokenizer [
	^ aTokenizer nextInternalSubsetToken
]
