"
This class validates elements that can only contain element content (no PCDATA) using a regular expression converted to a DFA. It ignores comments, PIs, and whitespace.
"
Class {
	#name : #XMLDFAElementContentElementValidator,
	#superclass : #XMLDFAElementValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #testing }
XMLDFAElementContentElementValidator >> ignoresWhitespace [
	^ true
]

{ #category : #testing }
XMLDFAElementContentElementValidator >> isElementContent [
	^ true
]

{ #category : #defaults }
XMLDFAElementContentElementValidator >> typeName [
	^ 'element content'
]

{ #category : #validating }
XMLDFAElementContentElementValidator >> validatePCData: aString [
	self errorUnexpectedPCData
]
