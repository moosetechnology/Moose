"
A WAUtf8CodecStream is a WACodecStream optimized for UTF-8 performance in the case where most of the characters are ASCII.

"
Class {
	#name : #GRPharoUtf8CodecStream,
	#superclass : #GRPharoConverterCodecStream,
	#classVars : [
		'Latin1ToUtf8Encodings',
		'Latin1ToUtf8Map'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #'class initialization' }
GRPharoUtf8CodecStream class >> initialize [
	(Smalltalk hasClassNamed: #UTF8TextConverter) "guard for Squeak 37"
		ifFalse: [ ^ self ].

	Latin1ToUtf8Map := ByteArray new: 256.
	Latin1ToUtf8Encodings := Array new: 256.
	0 to: 255 do:[ :index |
		| latin1 utf8 |
		latin1 := String with: (Character codePoint: index).
		utf8 := latin1 convertToWithConverter: UTF8TextConverter new.
		latin1 = utf8
			ifTrue:[
				Latin1ToUtf8Map at: index + 1 put: 0 ] "no translation needed"
			ifFalse:[
				Latin1ToUtf8Map at: index + 1 put: 1. "no translation needed"
				Latin1ToUtf8Encodings at: index + 1 put: utf8 ] ]
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> crlf [
	stream nextPut: Character cr.
	stream nextPut: Character lf
]

{ #category : #private }
GRPharoUtf8CodecStream >> encodeDefault: aString [
	"Convert the given string from UTF-8 using the fast path if converting to Latin-1"
	1 to: aString size by: 1 do: [ :index |
		converter nextPut: (aString at: index) toStream: stream ]
]

{ #category : #private }
GRPharoUtf8CodecStream >> encodeFast: aByteString [
	"Convert the given string from UTF-8 using the fast path if converting to Latin-1"
	| lastIndex nextIndex |
	lastIndex := 1.
	nextIndex := ByteString findFirstInString: aByteString inSet: Latin1ToUtf8Map startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream nextPutAll: aByteString ].
	[	nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		stream nextPutAll: (Latin1ToUtf8Encodings at: (aByteString byteAt: nextIndex) + 1).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: Latin1ToUtf8Map startingAt: lastIndex.
		nextIndex = 0 ] whileFalse.
	stream greaseNext: aByteString size - lastIndex + 1 putAll: aByteString startingAt: lastIndex
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> greaseNext: anInteger putAll: aCollection startingAt: startIndex [
	aCollection isByteString
		ifTrue: [ self greaseNext: anInteger putAllFast: aCollection startingAt: startIndex ]
		ifFalse: [ super greaseNext: anInteger putAll: aCollection startingAt: startIndex ]
]

{ #category : #private }
GRPharoUtf8CodecStream >> greaseNext: anInteger putAllFast: aByteString startingAt: startIndex [
	| lastIndex nextIndex |
	lastIndex := startIndex.
	nextIndex := ByteString findFirstInString: aByteString inSet: Latin1ToUtf8Map startingAt: lastIndex.
	nextIndex = 0 ifTrue: [ ^ stream greaseNext: anInteger putAll: aByteString startingAt: startIndex ].
	[	
		nextIndex >= (startIndex + anInteger) ifTrue: [
			^ stream greaseNext: startIndex + anInteger - lastIndex  putAll: aByteString startingAt: lastIndex ].
		nextIndex > lastIndex ifTrue: [
			stream greaseNext: nextIndex - lastIndex putAll: aByteString startingAt: lastIndex ].
		stream nextPutAll: (Latin1ToUtf8Encodings at: (aByteString byteAt: nextIndex) + 1).
		lastIndex := nextIndex + 1.
		nextIndex := ByteString findFirstInString: aByteString inSet: Latin1ToUtf8Map startingAt: lastIndex.
		(nextIndex = 0 or: [ nextIndex >= (startIndex + anInteger) ]) ] whileFalse.
	lastIndex >= (startIndex + anInteger) ifFalse: [
		stream greaseNext: startIndex + anInteger - lastIndex putAll: aByteString startingAt: lastIndex ]
]

{ #category : #private }
GRPharoUtf8CodecStream >> invalidUtf8 [
	^ GRInvalidUtf8Error signal: 'Invalid UTF-8 input'
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> next [
	^ (self next: 1) first
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> next: anInteger [
	"Convert the given string from UTF-8 using the fast path if converting to Latin-1"
	| output byte1 byte2 byte3 byte4 unicode count alreadyWide |
	output := ByteString new: anInteger.
	count := 0.
	alreadyWide := false.
	[ count < anInteger and: [ stream atEnd not ] ] whileTrue: [
		byte1 := stream next.
		unicode := byte1.
		(byte1 bitAnd: 16rE0) = 192 ifTrue: [ "two bytes"
			byte2 := stream next.
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			unicode := ((byte1 bitAnd: 31) bitShift: 6) + (byte2 bitAnd: 63) ].
		(byte1 bitAnd: 16rF0) = 224 ifTrue: [ "three bytes"
			byte2 := stream next.
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			byte3 := stream next.
			(byte3 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			unicode := ((byte1 bitAnd: 15) bitShift: 12) + ((byte2 bitAnd: 63) bitShift: 6)
				+ (byte3 bitAnd: 63).
			alreadyWide ifFalse: [
				output := WideString withAll: output.
				alreadyWide := true ] ].
		(byte1 bitAnd: 16rF8) = 240 ifTrue: [ "four bytes"
			byte2 := stream next.
			(byte2 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			byte3 := stream next.
			(byte3 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			byte4 := stream next.
			(byte4 bitAnd: 16rC0) = 16r80 ifFalse: [ self invalidUtf8 ].
			unicode := ((byte1 bitAnd: 16r7) bitShift: 18) +
							((byte2 bitAnd: 63) bitShift: 12) + 
							((byte3 bitAnd: 63) bitShift: 6) +
							(byte4 bitAnd: 63).
			alreadyWide ifFalse: [
				output := WideString withAll: output.
				alreadyWide := true ] ].
		unicode ifNil: [ self invalidUtf8 ].
		unicode = 16rFEFF "ignore BOM" ifFalse: [
			count := count + 1.
			output at: count put: (Character codePoint: unicode) ].
		unicode := nil ].
	^ count < anInteger
		ifTrue: [ output first: count ]
		ifFalse: [ output ]
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> nextPut: aCharacter [
	| codePoint shouldEncode |
	codePoint := aCharacter codePoint.
	codePoint > 255
		ifTrue: [ ^ self nextPutAll: (String with: aCharacter) ].
	shouldEncode := Latin1ToUtf8Map at: codePoint + 1.
	shouldEncode = 1
		ifTrue: [ stream nextPutAll: (Latin1ToUtf8Encodings at: codePoint + 1) ]
		ifFalse: [ stream nextPut: aCharacter ]
	
]

{ #category : #streaming }
GRPharoUtf8CodecStream >> nextPutAll: aString [
	aString isByteString
		ifTrue: [ self encodeFast: aString ]
		ifFalse: [ self encodeDefault: aString ]
]
