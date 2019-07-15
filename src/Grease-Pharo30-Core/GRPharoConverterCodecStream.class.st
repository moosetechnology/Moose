"
A WAConverterCodecStream is a WACodec stream around a TextConverter. It is always in text mode.

Instance Variables
	converter:		<TextConverter>

converter
	- the TextConverter used to do the encoding conversion

"
Class {
	#name : #GRPharoConverterCodecStream,
	#superclass : #GRCodecStream,
	#instVars : [
		'converter'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #'instance creation' }
GRPharoConverterCodecStream class >> on: aStream converter: aConverter [
	^ self basicNew initializeOn: aStream converter: aConverter
]

{ #category : #streaming }
GRPharoConverterCodecStream >> greaseNext: anInteger putAll: aCollection startingAt: startIndex [
	self nextPutAll: (aCollection copyFrom: startIndex to: startIndex + anInteger - 1)
]

{ #category : #initialization }
GRPharoConverterCodecStream >> initializeOn: aStream converter: aConverter [
	self initializeOn: aStream.
	converter := aConverter
]

{ #category : #streaming }
GRPharoConverterCodecStream >> next [
	| character |
	character := converter nextFromStream: stream.
	^ character isNil
		ifFalse: [ character asCharacter ]
]

{ #category : #streaming }
GRPharoConverterCodecStream >> next: anInteger [
	| writeStream |
	writeStream := WriteStream on: (String new: anInteger).
	anInteger timesRepeat: [
		writeStream nextPut: (self next
			ifNil: [ ^ writeStream contents ]) ].
	^ writeStream contents
]

{ #category : #streaming }
GRPharoConverterCodecStream >> nextPut: aCharacter [
	converter nextPut: aCharacter asCharacter toStream: stream
]

{ #category : #streaming }
GRPharoConverterCodecStream >> nextPutAll: aString [
	aString asString do: [ :each | self nextPut: each ]
]
