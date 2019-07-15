"
A read stream for single characters. This is faster and uses less memory than converting a char to a string and using a read stream on it.
"
Class {
	#name : #XMLSingleCharacterReadStream,
	#superclass : #XMLAbstractReadStream,
	#instVars : [
		'character',
		'atEnd'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLSingleCharacterReadStream >> atEnd [
	^ atEnd
]

{ #category : #closing }
XMLSingleCharacterReadStream >> close [
	atEnd := true
]

{ #category : #accessing }
XMLSingleCharacterReadStream >> contents [
	^ String with: character
]

{ #category : #accessing }
XMLSingleCharacterReadStream >> next [
	atEnd
		ifTrue: [^ nil]
		ifFalse: [
			atEnd := true.
			^ character]
]

{ #category : #initialization }
XMLSingleCharacterReadStream >> on: aCharacter [
	character := aCharacter.
	atEnd := false.
]

{ #category : #accessing }
XMLSingleCharacterReadStream >> peek [
	atEnd
		ifTrue: [^ nil]
		ifFalse: [^ character]
]

{ #category : #positioning }
XMLSingleCharacterReadStream >> position [
	^ atEnd
		ifTrue: [1]
		ifFalse: [0]
]

{ #category : #positioning }
XMLSingleCharacterReadStream >> position: anInteger [
	atEnd := anInteger > 0
]

{ #category : #printing }
XMLSingleCharacterReadStream >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: character;
		nextPut: $).
]

{ #category : #positioning }
XMLSingleCharacterReadStream >> reset [
	atEnd := false
]
