"
A stream converter for big endian UTF-32 streams, and the default converter class used when a UTF-32 stream converter is created with newForEncoding: or asXMLStreamConverter and no endian is specified by the encoding name.
"
Class {
	#name : #XMLUTF32BigEndianStreamConverter,
	#superclass : #XMLUTF32StreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLUTF32BigEndianStreamConverter class >> basicByteOrderMarkBytes [
	^ #[16r00 16r00 16rFE 16rFF]
]

{ #category : #basic }
XMLUTF32BigEndianStreamConverter class >> basicEncodingNames [
	^ #('UTF-32' 'UTF32'
			'UTF-32-BE' 'UTF32-BE' 'UTF-32BE' 'UTF32BE')
]

{ #category : #testing }
XMLUTF32BigEndianStreamConverter >> isBigEndian [
	^ true
]

{ #category : #basic }
XMLUTF32BigEndianStreamConverter >> nextFourBytesFromStream: aStream [
	| firstByte secondByte thirdByte |

	firstByte := aStream next asInteger bitShift: 24.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	secondByte := aStream next asInteger bitShift: 16.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	thirdByte := aStream next asInteger bitShift: 8.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	^ firstByte + secondByte + thirdByte + aStream next asInteger.
]

{ #category : #basic }
XMLUTF32BigEndianStreamConverter >> nextPutFourBytes: anInteger toStream: aStream [
	aStream
		nextPut: ((anInteger bitShift: -24) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -16) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -8) bitAnd: 16rFF);
		nextPut: (anInteger bitAnd: 16rFF)
]
