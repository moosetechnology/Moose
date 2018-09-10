"
A state for content tokens, everything from the first stat tag to the end of the document.
"
Class {
	#name : #XMLContentState,
	#superclass : #XMLTokenizerState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #testing }
XMLContentState >> isContentState [
	^ true
]

{ #category : #tokenizing }
XMLContentState >> nextTokenFrom: aTokenizer [
	^ aTokenizer nextContentToken
]
