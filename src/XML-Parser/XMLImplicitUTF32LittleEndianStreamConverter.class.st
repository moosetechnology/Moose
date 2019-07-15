"
A stream converter for implicit little endian UTF-32 streams.
"
Class {
	#name : #XMLImplicitUTF32LittleEndianStreamConverter,
	#superclass : #XMLUTF32LittleEndianStreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #testing }
XMLImplicitUTF32LittleEndianStreamConverter class >> isImplicit [
	^ true
]
