"
A stream converter for implicit big endian UTF-32 streams.
"
Class {
	#name : #XMLImplicitUTF32BigEndianStreamConverter,
	#superclass : #XMLUTF32BigEndianStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLImplicitUTF32BigEndianStreamConverter class >> isImplicit [
	^ true
]
