"
A stream converter that does no encoding or decoding.
"
Class {
	#name : #XMLNullStreamConverter,
	#superclass : #XMLStatelessStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLNullStreamConverter >> isNull [
	^ true
]

{ #category : #decoding }
XMLNullStreamConverter >> nextFromStream: aStream [
	aStream atEnd
		ifTrue: [^ nil]
		ifFalse: [^ aStream next asCharacter]
]

{ #category : #encoding }
XMLNullStreamConverter >> nextPut: aCharacter toStream: aStream [
	aStream nextPut: aCharacter asInteger
]
