"
A base class for XMLParser exceptions that supports line number error info and can be used with on:do: to catch any XMLParser-related errors.
"
Class {
	#name : #XMLParserException,
	#superclass : #XMLException,
	#instVars : [
		'lineNumber',
		'columnNumber',
		'baseURI'
	],
	#category : #'XML-Parser-Exceptions'
}

{ #category : #accessing }
XMLParserException >> baseURI [
	^ baseURI ifNil: [baseURI := '']
]

{ #category : #accessing }
XMLParserException >> baseURI: aURIString [
	baseURI := aURIString
]

{ #category : #accessing }
XMLParserException >> columnNumber [
	^ columnNumber
]

{ #category : #accessing }
XMLParserException >> columnNumber: aColumnNumber [
	columnNumber := aColumnNumber
]

{ #category : #testing }
XMLParserException >> hasBaseURI [
	^ self baseURI notEmpty
]

{ #category : #testing }
XMLParserException >> hasColumnNumber [
	^ self columnNumber notNil
]

{ #category : #testing }
XMLParserException >> hasLineNumber [
	^ self lineNumber notNil
]

{ #category : #testing }
XMLParserException >> isXMLParserException [
	^ true
]

{ #category : #accessing }
XMLParserException >> lineNumber [
	^ lineNumber
]

{ #category : #accessing }
XMLParserException >> lineNumber: aLineNumber [
	lineNumber := aLineNumber
]

{ #category : #accessing }
XMLParserException >> messageText [
	| rawMessageText messageTextStream |

	rawMessageText := super messageText.
	(self hasLineNumber
		or: [self hasBaseURI])
		ifFalse: [^ rawMessageText].

	(messageTextStream := (String new: rawMessageText size * 2) writeStream)
		nextPutAll: rawMessageText;
		nextPutAll: ' ('.
	self hasLineNumber
		ifTrue: [
			messageTextStream
				nextPutAll: 'near line ';
				nextPutAll: self lineNumber asString.
			self hasColumnNumber
				ifTrue: [
					messageTextStream
						nextPutAll: ', column ';
						nextPutAll: self columnNumber asString]].

	self hasBaseURI
		ifTrue: [
			messageTextStream
				nextPutAll:
					(self hasLineNumber
						ifTrue: [' in ']
						ifFalse: ['in ']);
				nextPutAll: self baseURI].
			
	^ messageTextStream
		nextPut: $);
		contents.
]

{ #category : #testing }
XMLParserException >> shouldPassOnWhenCaught [
	^ true
]
