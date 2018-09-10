"
A codec defines how Seaside communicates without the outside world and how outside data is converted into the image (decoding) and back outside the image (encoding). The codec is essentially a stream factory that provides wrappers around standard streams. All streams do support binary mode for non-converted transfer.
"
Class {
	#name : #GRCodec,
	#superclass : #GRObject,
	#category : #'Grease-Core-Text'
}

{ #category : #accessing }
GRCodec class >> allCodecs [
	"Answer all codecs supported in this system. This is a collection of codec instances."

	^ self subclasses
		inject: self codecs asArray
		into: [ :result :each | result , each allCodecs ]
]

{ #category : #private }
GRCodec class >> basicForEncoding: aString [
	"Create the actual instance."
	self subclassResponsibility
]

{ #category : #accessing }
GRCodec class >> codecs [
	"Answer a collection of possible codecs of the receiver. To be overridden by concrete subclasses."

	^ #()
]

{ #category : #'instance creation' }
GRCodec class >> forEncoding: aString [
	"Answer a new codec instance for the given encoding name. Raise an WAUnsupportedEncodingError if the encoding name is not supported by this image."

	self allSubclassesDo: [ :each | 
		(each supportsEncoding: aString)
			ifTrue: [ ^ each basicForEncoding: aString ] ].
	^ self unsupportedEncoding: aString
]

{ #category : #testing }
GRCodec class >> supportsEncoding: aString [
	"Answer whether the the given encoding name is supported by this codec class."
	self subclassResponsibility
]

{ #category : #private }
GRCodec class >> unsupportedEncoding: aString [
	"Signal an unsupported encoding."

	^ GRUnsupportedEncodingError signal: 'unsupported encoding: ' , aString
]

{ #category : #convenience }
GRCodec >> decode: aString [
	| readStream writeStream |
	readStream := self decoderFor: aString readStream.
	writeStream := GRPlatform current writeCharacterStreamOn: (String new: aString size).
	[ readStream atEnd ]
		whileFalse: [ writeStream nextPutAll: (readStream next: 1024) ].
	^ writeStream contents
]

{ #category : #conversion }
GRCodec >> decoderFor: aReadStream [
	"Wrap aReadStream with an decoder for the codec of the receiver. Answer a read stream that delegates to and shares the state of aReadStream." 
	
	self subclassResponsibility
]

{ #category : #convenience }
GRCodec >> encode: aString [
	| writeStream |
	writeStream := self encoderFor: (GRPlatform current
		writeCharacterStreamOn:  (String new: aString size)).
	writeStream nextPutAll: aString.
	^ writeStream contents
]

{ #category : #conversion }
GRCodec >> encoderFor: aWriteStream [
	"Wrap aWriteStream with an encoder for the codec of the receiver. Answer a write stream that delegates to and shares the state of aWriteStream."
	
	self subclassResponsibility
]

{ #category : #accessing }
GRCodec >> name [
	"Answer a human readable string of the receivers encoding policy."

	self subclassResponsibility
]

{ #category : #printing }
GRCodec >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' name: '; print: self name
]

{ #category : #accessing }
GRCodec >> url [
	"Answer a codec that is responsible to encode and decode URLs. In most cases an UTF-8 codec is the only valid choice, but subclasses might decide to do something else."

	self subclassResponsibility
]
