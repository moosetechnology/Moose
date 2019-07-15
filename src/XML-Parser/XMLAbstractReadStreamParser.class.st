"
This class is a generic abstract parser class for read-stream based parsers. It wraps its input stream with an XMLReadStreamAdapter and can parse tokens using #nextDelimitedBy: and #nextDelimitedByAny: and a temp write stream buffer.
"
Class {
	#name : #XMLAbstractReadStreamParser,
	#superclass : #Object,
	#instVars : [
		'readStream',
		'writeStream'
	],
	#category : #'XML-Parser-Utils'
}

{ #category : #'instance creation' }
XMLAbstractReadStreamParser class >> new [
	self shouldNotImplement
]

{ #category : #'instance creation' }
XMLAbstractReadStreamParser class >> on: aStringOrStream [
	^ self basicNew initialize on: aStringOrStream
]

{ #category : #tokenizing }
XMLAbstractReadStreamParser >> nextDelimitedBy: aCharacter [
	writeStream reset.
	[readStream atEnd
		or: [readStream peek = aCharacter]]
		whileFalse: [writeStream nextPut: readStream next].
	^ writeStream contents.
]

{ #category : #tokenizing }
XMLAbstractReadStreamParser >> nextDelimitedByAny: aCharacterCollection [
	writeStream reset.
	[readStream atEnd
		or: [aCharacterCollection includes: readStream peek]]
		whileFalse: [writeStream nextPut: readStream next].
	^ writeStream contents.
]

{ #category : #initialization }
XMLAbstractReadStreamParser >> on: aStringOrStream [
	readStream :=
		XMLReadStreamAdapter on:
			(aStringOrStream isStream
				ifTrue: [aStringOrStream]
				ifFalse: [aStringOrStream readStream]).
	writeStream := (String new: 64) writeStream.
]
