Extension { #name : #Object }

{ #category : #'*XML-Parser' }
Object >> isXMLBinaryOrExternalStream [
	"Not every stream or stream-like object is a subclass of Stream, so this
	must be defined here.

	At a minimum, these streams must accept binary objects (like SmallIntegers
	and ByteArrays) when writing. When reading, they can return byte values
	as SmallIntegers or Characters and collections of byte values as ByteArrays
	or ByteStrings."

	^ self isStream
		and: [(self respondsTo: #isBinary)
			and: [self isBinary]]
]

{ #category : #'*XML-Parser' }
Object >> isXMLConvertingStreamAdapter [
	^ false
]
