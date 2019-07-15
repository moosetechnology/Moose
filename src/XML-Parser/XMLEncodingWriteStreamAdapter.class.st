"
A write stream adapter that encodes stream contents using a stream converter.
"
Class {
	#name : #XMLEncodingWriteStreamAdapter,
	#superclass : #XMLWriteStreamAdapter,
	#instVars : [
		'streamConverter'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #'instance creation' }
XMLEncodingWriteStreamAdapter class >> on: aStream [
	^ self
		on: aStream
		streamConverter: XMLStreamConverter default
]

{ #category : #'instance creation' }
XMLEncodingWriteStreamAdapter class >> on: aStream streamConverter: aStreamConverter [
	^ (self basicOn:
		(aStream isXMLBinaryOrExternalStream
			ifTrue: [aStream]
			ifFalse: [XMLStringWriteStreamAdapter on: aStream]))
		streamConverter: aStreamConverter
]

{ #category : #testing }
XMLEncodingWriteStreamAdapter >> hasDefaultStreamConverter [
	^ streamConverter isDefault
]

{ #category : #testing }
XMLEncodingWriteStreamAdapter >> hasImplicitStreamConverter [
	^ streamConverter isImplicit
]

{ #category : #testing }
XMLEncodingWriteStreamAdapter >> hasNullStreamConverter [
	^ streamConverter isNull
]

{ #category : #testing }
XMLEncodingWriteStreamAdapter >> isXMLConvertingStreamAdapter [
	^ true
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapter >> nextPut: aCharacter [
	streamConverter
		nextPut: aCharacter
		toStream: stream.
	^ aCharacter.
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapter >> nextPutAll: aCollection [
	"can't use #to:do: here because other #nextPutAll: implementations
	support non-sequenceable collection arguments wtih #do:"
	aCollection do: [:each |
		streamConverter
			nextPut: each
			toStream: stream].
	^ aCollection.
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapter >> nextPutByteOrderMark [
	streamConverter nextPutByteOrderMarkToStream: stream
]

{ #category : #printing }
XMLEncodingWriteStreamAdapter >> printStreamOn: aStream [
	streamConverter
		printWithConvertableStream: stream
		on: aStream
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapter >> streamConverter [
	^ streamConverter
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapter >> streamConverter: aStreamConverter [
	streamConverter :=
		aStreamConverter ifNil: [XMLStreamConverter null]
]
