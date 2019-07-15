"
A write stream adapter for percent encoding octets for URIs.
"
Class {
	#name : #XMLPercentEncodingWriteStreamAdapter,
	#superclass : #XMLWriteStreamAdapter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLPercentEncodingWriteStreamAdapter >> isBinary [
	"this stream is binary, because it accepts binary octet values
	and percent-encodes them as '%HH' character sequences"
	^ true
]

{ #category : #accessing }
XMLPercentEncodingWriteStreamAdapter >> nextPut: anObject [
	| byte |

	stream nextPut: $%.

	"pad it if needed"
	(byte := anObject asInteger) < 16r10
		ifTrue: [stream nextPut: $0].

	"On GS, #printOn:base: shows the radix, so #printOn:base:showRadix:
	is used instead"
	byte
		printOn: stream
		base: 16
		showRadix: false.
	^ anObject.
]

{ #category : #accessing }
XMLPercentEncodingWriteStreamAdapter >> nextPutAll: aCollection [
	"can't use #to:do: here because other #nextPutAll: implementations
	support non-sequenceable collection arguments wtih #do:"
	aCollection do: [:each |
		self nextPut: each].
	^ aCollection.
]
