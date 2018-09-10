Class {
	#name : #GRPharoGenericCodec,
	#superclass : #GRCodec,
	#instVars : [
		'name',
		'urlCodec'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #private }
GRPharoGenericCodec class >> basicForEncoding: aString [
	(self supportsEncoding: aString)
		ifFalse: [ self unsupportedEncoding: aString ].
	^ self basicNew initializeWithName: aString
]

{ #category : #accessing }
GRPharoGenericCodec class >> codecs [
	^ (TextConverter allEncodingNames
		select:  [ :each | 
			"exclude UFT-8 which is handeled by WAUtf8Codec"
			self supportsEncoding: each ])
		collect: [ :each |
			self basicForEncoding: each greaseString ]
]

{ #category : #private }
GRPharoGenericCodec class >> supportedEncodingNames [
	"answers the names of the encodings supported by this class"

	^ TextConverter allEncodingNames
		removeAllFoundIn: GRPharoLatin1Codec supportedEncodingNames;
		removeAllFoundIn: UTF8TextConverter encodingNames;
		yourself
]

{ #category : #testing }
GRPharoGenericCodec class >> supportsEncoding: aString [
	"Answer whether the the given encoding name is supported."
	^ self supportedEncodingNames includes: aString
]

{ #category : #private }
GRPharoGenericCodec >> converter [
	^ TextConverter newForEncoding: self name
]

{ #category : #conversion }
GRPharoGenericCodec >> decoderFor: aStream [
	^ self encoderFor: aStream
]

{ #category : #conversion }
GRPharoGenericCodec >> encoderFor: aStream [ 
	^ GRPharoConverterCodecStream 
		on: aStream
		converter: self converter
]

{ #category : #initialization }
GRPharoGenericCodec >> initializeWithName: aString [ 
	self initialize.
	name := aString.
	urlCodec := (#('iso-8859-15' 'cp-1252') includes: aString) 
		ifFalse: [ GRCodec forEncoding: 'utf-8' ]
		ifTrue: [ self ]
]

{ #category : #accessing }
GRPharoGenericCodec >> name [
	^ name
]

{ #category : #accessing }
GRPharoGenericCodec >> url [
	"RFC 3986: When a new URI scheme defines a component that represents textual data consisting of characters from the Universal Character Set [UCS], the data should first be encoded as octets according to the UTF-8 character encoding."

	^ urlCodec
]
