"
A state for external subset tokens.
"
Class {
	#name : #XMLExternalSubsetState,
	#superclass : #XMLTokenizerState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #testing }
XMLExternalSubsetState >> isExternalSubsetState [
	^ true
]

{ #category : #tokenizing }
XMLExternalSubsetState >> nextTokenFrom: aTokenizer [
	^ aTokenizer nextExternalSubsetToken
]
