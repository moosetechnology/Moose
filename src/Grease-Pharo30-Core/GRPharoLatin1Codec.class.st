"
A GRPharoLatin1Codec is a WACodec optimized for ISO-8859-1 (direct byte to character mapping).
"
Class {
	#name : #GRPharoLatin1Codec,
	#superclass : #GRNullCodec,
	#instVars : [
		'name'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #private }
GRPharoLatin1Codec class >> basicForEncoding: aString [
	(self supportsEncoding: aString)
		ifFalse: [ self unsupportedEncoding: aString ].
	^ self basicNew initializeWithName: aString
]

{ #category : #accessing }
GRPharoLatin1Codec class >> codecs [
	^ Array with: (self basicForEncoding: 'iso-8859-1')
]

{ #category : #private }
GRPharoLatin1Codec class >> supportedEncodingNames [
	^ #('iso-8859-1' 'ISO-8859-1' 'latin-1' 'latin1')
]

{ #category : #private }
GRPharoLatin1Codec class >> supportsEncoding: aString [
	"Answer whether the the given encoding name is supported."
	^ self supportedEncodingNames includes: aString
]

{ #category : #conversion }
GRPharoLatin1Codec >> decode: aStringOrByteArray [
	"Overridden for efficencey."

	^ aStringOrByteArray asString
]

{ #category : #conversion }
GRPharoLatin1Codec >> decoderFor: aReadStream [ 
	"wrap to avoid String vs ByteArray issues"
	^ GRPharoLatin1CodecStream on: aReadStream
]

{ #category : #conversion }
GRPharoLatin1Codec >> encoderFor: aWriteStream [ 
	"wrap to avoid String vs ByteArray issues"
	^ GRPharoLatin1CodecStream on: aWriteStream
]

{ #category : #initialization }
GRPharoLatin1Codec >> initializeWithName: aString [ 
	self initialize.
	name := aString
]

{ #category : #accessing }
GRPharoLatin1Codec >> name [
	^ name
]
