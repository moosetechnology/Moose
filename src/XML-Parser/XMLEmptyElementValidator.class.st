"
This class validates EMPTY elements, which can't contain elements, PCDATA, or even comments or PIs.
"
Class {
	#name : #XMLEmptyElementValidator,
	#superclass : #XMLElementValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #testing }
XMLEmptyElementValidator >> atEnd [
	^ true
]

{ #category : #testing }
XMLEmptyElementValidator >> isEmpty [
	^ true
]

{ #category : #defaults }
XMLEmptyElementValidator >> typeName [
	^ 'EMPTY'
]

{ #category : #validating }
XMLEmptyElementValidator >> validateComment: aString [
	self errorUnexpectedComment
]

{ #category : #validating }
XMLEmptyElementValidator >> validatePCData: aString [
	self errorUnexpectedPCData
]

{ #category : #validating }
XMLEmptyElementValidator >> validatePI: aTargetString data: aDataString [
	self errorUnexpectedPI
]

{ #category : #validating }
XMLEmptyElementValidator >> validateStartTag: anElement [
	self errorUnexpectedElement: anElement
]
