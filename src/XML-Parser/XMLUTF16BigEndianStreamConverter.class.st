"
A stream converter for big endian UTF-16 streams, and the default converter class used when a UTF-16 stream converter is created with newForEncoding: or asXMLStreamConverter and no endian is specified by the encoding name.
"
Class {
	#name : #XMLUTF16BigEndianStreamConverter,
	#superclass : #XMLUTF16StreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLUTF16BigEndianStreamConverter class >> basicByteOrderMarkBytes [
	^ #[16rFE 16rFF]
]

{ #category : #basic }
XMLUTF16BigEndianStreamConverter class >> basicEncodingNames [
	^ #('UTF-16' 'UTF16'
			'UTF-16-BE' 'UTF16-BE' 'UTF-16BE' 'UTF16BE')
]

{ #category : #testing }
XMLUTF16BigEndianStreamConverter >> isBigEndian [
	^ true
]

{ #category : #basic }
XMLUTF16BigEndianStreamConverter >> nextPutTwoBytes: anInteger toStream: aStream [
	aStream
		nextPut: ((anInteger bitShift: -8) bitAnd: 16rFF);
		nextPut: (anInteger bitAnd: 16rFF)
]

{ #category : #basic }
XMLUTF16BigEndianStreamConverter >> nextTwoBytesFromStream: aStream [
	| firstByte |

	firstByte := aStream next asInteger bitShift: 8.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	^ firstByte + aStream next asInteger.
]
