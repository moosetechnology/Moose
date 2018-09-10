"
This is a base class for element validators.
"
Class {
	#name : #XMLElementValidator,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLElementValidator class >> element: anElement [
	^ self new element: anElement
]

{ #category : #converting }
XMLElementValidator >> asReadyElementValidator [
	^ self
]

{ #category : #testing }
XMLElementValidator >> atEnd [
	self subclassResponsibility
]

{ #category : #accessing }
XMLElementValidator >> element [
	^ element
]

{ #category : #accessing }
XMLElementValidator >> element: anElement [
	element := anElement
]

{ #category : #private }
XMLElementValidator >> errorUnexpected: aDescription [
	XMLValidationException
		formatSignal: 'Unexpected {1} in {2} type element <{3}>'
		with: aDescription
		with: self typeName
		with: self element
]

{ #category : #private }
XMLElementValidator >> errorUnexpectedComment [
	^ self errorUnexpected: 'comment'
]

{ #category : #private }
XMLElementValidator >> errorUnexpectedElement: anElement [
	XMLValidationException
		formatSignal: 'Unexpected <{1}> element in {2} type element <{3}>'
		with: anElement
		with: self typeName
		with: self element
]

{ #category : #private }
XMLElementValidator >> errorUnexpectedPCData [
	^ self errorUnexpected: 'PCDATA'
]

{ #category : #private }
XMLElementValidator >> errorUnexpectedPI [
	^ self errorUnexpected: 'processing instruction'
]

{ #category : #testing }
XMLElementValidator >> ignoresWhitespace [
	^ false
]

{ #category : #testing }
XMLElementValidator >> isAny [
	^ false
]

{ #category : #testing }
XMLElementValidator >> isElementContent [
	^ false
]

{ #category : #testing }
XMLElementValidator >> isEmpty [
	^ false
]

{ #category : #testing }
XMLElementValidator >> isMixedContent [
	^ false
]

{ #category : #printing }
XMLElementValidator >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPutAll: '(<';
		nextPutAll: self element;
		nextPutAll: '>)'.
]

{ #category : #defaults }
XMLElementValidator >> typeName [
	self subclassResponsibility
]

{ #category : #validating }
XMLElementValidator >> validateComment: aString [
]

{ #category : #validating }
XMLElementValidator >> validateElementDeclaration [
]

{ #category : #validating }
XMLElementValidator >> validatePCData: aString [
]

{ #category : #validating }
XMLElementValidator >> validatePI: aTargetString data: aDataString [
]

{ #category : #validating }
XMLElementValidator >> validateStartTag: anElement [
]
