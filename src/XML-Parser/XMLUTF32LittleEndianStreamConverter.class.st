"
A stream converter for little endian UTF-32 streams.
"
Class {
	#name : #XMLUTF32LittleEndianStreamConverter,
	#superclass : #XMLUTF32StreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLUTF32LittleEndianStreamConverter class >> basicByteOrderMarkBytes [
	^ #[16rFF 16rFE 16r00 16r00]
]

{ #category : #basic }
XMLUTF32LittleEndianStreamConverter class >> basicEncodingNames [
	^ #('UTF-32-LE' 'UTF32-LE' 'UTF-32LE' 'UTF32LE')
]

{ #category : #testing }
XMLUTF32LittleEndianStreamConverter >> isBigEndian [
	^ false
]

{ #category : #basic }
XMLUTF32LittleEndianStreamConverter >> nextFourBytesFromStream: aStream [
	| firstByte secondByte thirdByte |

	firstByte := aStream next asInteger.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	secondByte := aStream next asInteger bitShift: 8.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	thirdByte := aStream next asInteger bitShift: 16.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	^ firstByte + secondByte + thirdByte + (aStream next asInteger bitShift: 24).
]

{ #category : #basic }
XMLUTF32LittleEndianStreamConverter >> nextPutFourBytes: anInteger toStream: aStream [
	aStream
		nextPut: (anInteger bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -8) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -16) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -24) bitAnd: 16rFF)
]
