"
A write stream adapter for writing node content with whitespace insertion if needed between writes.
"
Class {
	#name : #XMLNodeContentWriteStreamAdapter,
	#superclass : #XMLWriteStreamAdapter,
	#instVars : [
		'lastChar'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #private }
XMLNodeContentWriteStreamAdapter >> insertSpaceBefore: aCharacter [
	(lastChar == nil
		or: [lastChar isXMLWhitespace
			or: [aCharacter isXMLWhitespace]])
		ifFalse: [stream nextPut: SpaceCharacter]
]

{ #category : #accessing }
XMLNodeContentWriteStreamAdapter >> nextPut: aCharacter [
	self insertSpaceBefore: aCharacter.
	stream nextPut: aCharacter.
	^ lastChar := aCharacter.
]

{ #category : #accessing }
XMLNodeContentWriteStreamAdapter >> nextPutAll: aString [
	aString size > 0 "optimization"
		ifTrue: [
			self insertSpaceBefore: aString first.
			stream nextPutAll: aString.
			lastChar := aString last].
	^ aString.
]
