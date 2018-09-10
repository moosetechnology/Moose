"
A WANullCodecStream is a WriteStream on a String on which you can both put binary and character data without encoding happening.

Instance Variables
	stream:		<WriteStream>

stream
	- a WriteStream on a String

"
Class {
	#name : #GRNullCodecStream,
	#superclass : #GRCodecStream,
	#category : #'Grease-Core-Text'
}

{ #category : #streaming }
GRNullCodecStream >> next [
	^ stream next
]

{ #category : #streaming }
GRNullCodecStream >> next: anInteger [
	^ stream next: anInteger
]

{ #category : #streaming }
GRNullCodecStream >> nextPut: aCharacterOrByte [
	aCharacterOrByte isCharacter
		ifTrue: [ stream nextPut: aCharacterOrByte ]
		ifFalse: [ stream nextPut: (Character codePoint: aCharacterOrByte) ]
]

{ #category : #streaming }
GRNullCodecStream >> nextPutAll: aStringOrByteArray [
	aStringOrByteArray isString
		ifTrue: [ stream nextPutAll: aStringOrByteArray ]
		ifFalse: [
			1 to: aStringOrByteArray size do: [ :index |
				stream nextPut: (Character codePoint: (aStringOrByteArray at: index)) ] ]
]
