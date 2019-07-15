"
A stream converter that wraps the ZnByteEncoder legacy byte encoder class. (Requires Zinc.)
"
Class {
	#name : #XMLZincByteEncoderStreamConverter,
	#superclass : #XMLStreamConverter,
	#instVars : [
		'zincByteEncoder',
		'stringReadStreamAdapter'
	],
	#classVars : [
		'NullReadStream'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLZincByteEncoderStreamConverter class >> basicCanConvertEncoding: anEncodingName [
	^ XMLClassFinder
		classNamed: #ZnByteEncoder
		ifPresent: [:zincByteEncoderClass |
			zincByteEncoderClass handlesEncoding: anEncodingName]
		ifAbsent: [false]
]

{ #category : #'class initialization' }
XMLZincByteEncoderStreamConverter class >> initialize [
	"self initialize"

	NullReadStream := XMLNullReadStream new
]

{ #category : #initialization }
XMLZincByteEncoderStreamConverter >> initializeForEncoding: anEncodingName [
	zincByteEncoder :=
		(XMLClassFinder classNamed: #ZnByteEncoder) newForEncoding: anEncodingName.

	"we use an XMLStringReadStreamAdapter to transparently handle non-binary
	character streams for ZnByteEncoder, which exepcts binary streams, and
	since it's only ever set to a non-null stream during #nextFromStream:,
	instances can still be shared by multiple streams, just not re-entrently,
	which is OK since this class is explicitly stateful and so not
	automatically thread-safe."
	stringReadStreamAdapter :=
		XMLStringReadStreamAdapter on: NullReadStream.
]

{ #category : #decoding }
XMLZincByteEncoderStreamConverter >> nextFromStream: aStream [
	"ZnByteEncoder does not check for #atEnd before sending #next"
	aStream atEnd
		ifTrue: [^ nil]
		ifFalse: [| nextChar |
			nextChar :=
				zincByteEncoder nextFromStream:
					(stringReadStreamAdapter on: aStream).
			stringReadStreamAdapter on: NullReadStream.
			^ nextChar]
]

{ #category : #encoding }
XMLZincByteEncoderStreamConverter >> nextPut: aCharacter toStream: aStream [
	zincByteEncoder
		nextPut: aCharacter
		toStream: aStream
]
