"
A stream converter for implicit little endian UTF-16 streams.
"
Class {
	#name : #XMLImplicitUTF16LittleEndianStreamConverter,
	#superclass : #XMLUTF16LittleEndianStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLImplicitUTF16LittleEndianStreamConverter class >> isImplicit [
	^ true
]
