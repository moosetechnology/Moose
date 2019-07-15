"
This class is a facade that parses XML using a driver and tokenizer. See SAXHandler and XMLDOMParser for ready-made front ends to it.
"
Class {
	#name : #XMLParser,
	#superclass : #Object,
	#instVars : [
		'tokenizer',
		'driver'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #'instance creation' }
XMLParser class >> driver: aDriver on: aStringOrStream [
	^ self new
		setDriver: aDriver
		tokenizer: (aDriver newTokenizerOn: aStringOrStream)
]

{ #category : #testing }
XMLParser >> atEnd [
	^ self tokenizer atEnd
]

{ #category : #accessing }
XMLParser >> baseURI [
	^ self driver baseURI
]

{ #category : #accessing }
XMLParser >> currentColumnNumber [
	^ self tokenizer currentColumnNumber
]

{ #category : #accessing }
XMLParser >> currentLineNumber [
	^ self tokenizer currentLineNumber
]

{ #category : #accessing }
XMLParser >> currentPosition [
	^ self tokenizer currentPosition
]

{ #category : #accessing }
XMLParser >> driver [
	^ driver
]

{ #category : #private }
XMLParser >> handleParserError: anError [
	self tokenizer closeStreams.

	anError isXMLParserException
		ifFalse: [anError pass].

	(anError hasLineNumber
		or: [self currentLineNumber isNil])
		ifFalse: [anError lineNumber: self currentLineNumber].
	(anError hasColumnNumber
		or: [self currentColumnNumber isNil])
		ifFalse: [anError columnNumber: self currentColumnNumber].
	(anError hasBaseURI
		or: [self baseURI isEmpty])
		ifFalse: [anError baseURI: self baseURI].

	anError shouldPassOnWhenCaught
		ifTrue: [anError pass].
]

{ #category : #parsing }
XMLParser >> parseDocument [
	[[self tokenizer atEnd]
		whileFalse: [self tokenizer nextToken]]
		on: Error
		do: [:error | self handleParserError: error]
]

{ #category : #parsing }
XMLParser >> parseDocumentUntil: aBlock [
	[[self tokenizer atEnd or: [aBlock value]]
		whileFalse: [self tokenizer nextToken]]
		on: Error
		do: [:error | self handleParserError: error]
]

{ #category : #parsing }
XMLParser >> parseDocumentWhile: aBlock [
	[[self tokenizer atEnd not and: [aBlock value]]
		whileTrue: [self tokenizer nextToken]]
		on: Error
		do: [:error | self handleParserError: error]
]

{ #category : #parsing }
XMLParser >> parseToken [
	^ [self tokenizer nextToken]
		on: Error
		do: [:error | self handleParserError: error]
]

{ #category : #initialization }
XMLParser >> setDriver: aDriver tokenizer: aTokenizer [
	driver := aDriver.
	tokenizer := aTokenizer.
]

{ #category : #accessing }
XMLParser >> state [
	^ self tokenizer state
]

{ #category : #accessing }
XMLParser >> state: aTokenState [
	self tokenizer state: aTokenState
]

{ #category : #accessing }
XMLParser >> tokenizer [
	^ tokenizer
]
