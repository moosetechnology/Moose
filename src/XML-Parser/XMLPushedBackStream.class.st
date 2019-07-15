"
A base class to store a nested stream for XMLNestedStreamReader, along with its callback and the current position, line number, and line start position of the current external stream.
"
Class {
	#name : #XMLPushedBackStream,
	#superclass : #Object,
	#instVars : [
		'stream',
		'whenPoppedDo',
		'currentPosition',
		'currentLineNumber',
		'currentLineStartPosition'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #'instance creation' }
XMLPushedBackStream class >> stream: aStream whenPoppedDo: aBlock currentPosition: aPosition currentLineNumber: aLineNumber currentLineStartPosition: aStartPosition [
	^ self new
		setStream: aStream
		whenPoppedDo: aBlock
		currentPosition: aPosition
		currentLineNumber: aLineNumber
		currentLineStartPosition: aStartPosition
]

{ #category : #accessing }
XMLPushedBackStream >> currentLineNumber [
	^ currentLineNumber
]

{ #category : #accessing }
XMLPushedBackStream >> currentLineStartPosition [
	^ currentLineStartPosition
]

{ #category : #accessing }
XMLPushedBackStream >> currentPosition [
	^ currentPosition
]

{ #category : #testing }
XMLPushedBackStream >> isExternal [
	^ false
]

{ #category : #printing }
XMLPushedBackStream >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: stream;
		nextPut: $).
]

{ #category : #initialization }
XMLPushedBackStream >> setStream: aStream whenPoppedDo: aBlock currentPosition: aPosition currentLineNumber: aLineNumber currentLineStartPosition: aStartPosition [
	stream := aStream.
	whenPoppedDo := aBlock.
	currentPosition := aPosition.
	currentLineNumber := aLineNumber.
	currentLineStartPosition := aStartPosition.
]

{ #category : #accessing }
XMLPushedBackStream >> stream [
	^ stream
]

{ #category : #accessing }
XMLPushedBackStream >> whenPoppedDo [
	^ whenPoppedDo
]
