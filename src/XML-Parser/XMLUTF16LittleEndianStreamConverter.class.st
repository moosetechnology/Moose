"
A stream converter for little endian UTF-16 streams.
"
Class {
	#name : #XMLUTF16LittleEndianStreamConverter,
	#superclass : #XMLUTF16StreamConverter,
	#category : #'XML-Parser-Streams'
}

{ #category : #basic }
XMLUTF16LittleEndianStreamConverter class >> basicByteOrderMarkBytes [
	^ #[16rFF 16rFE]
]

{ #category : #basic }
XMLUTF16LittleEndianStreamConverter class >> basicEncodingNames [
	^ #('UTF-16-LE' 'UTF16-LE' 'UTF-16LE' 'UTF16LE')
]

{ #category : #testing }
XMLUTF16LittleEndianStreamConverter >> isBigEndian [
	^ false
]

{ #category : #basic }
XMLUTF16LittleEndianStreamConverter >> nextPutTwoBytes: anInteger toStream: aStream [
	aStream
		nextPut: (anInteger bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -8) bitAnd: 16rFF)
]

{ #category : #basic }
XMLUTF16LittleEndianStreamConverter >> nextTwoBytesFromStream: aStream [
	| firstByte |

	firstByte := aStream next asInteger.

	aStream atEnd
		ifTrue: [self errorBadCharacterEncoding].
	^ firstByte + (aStream next asInteger bitShift: 8).
]
