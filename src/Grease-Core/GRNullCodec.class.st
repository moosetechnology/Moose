"
The null codec always returns the original streams. It assumes that the outside world uses the same encoding as the inside world. This is highly efficient as no transformation is applied to the data, but has its drawbacks.
"
Class {
	#name : #GRNullCodec,
	#superclass : #GRCodec,
	#category : #'Grease-Core-Text'
}

{ #category : #private }
GRNullCodec class >> basicForEncoding: aString [
	^ self new
]

{ #category : #accessing }
GRNullCodec class >> codecName [
	^ '(none)'
]

{ #category : #accessing }
GRNullCodec class >> codecs [
	^ Array with: self new
]

{ #category : #testing }
GRNullCodec class >> supportsEncoding: aString [
	^ aString isNil
]

{ #category : #convenience }
GRNullCodec >> decode: aString [
	"Overridden for efficiency."

	^ aString
]

{ #category : #conversion }
GRNullCodec >> decoderFor: aReadStream [ 
	"wrap to avoid String vs ByteArray issues"
	^ GRNullCodecStream on: aReadStream
]

{ #category : #convenience }
GRNullCodec >> encode: aString [
	"Overridden for efficiency."

	^ aString
]

{ #category : #conversion }
GRNullCodec >> encoderFor: aWriteStream [ 
	"wrap to avoid String vs ByteArray issues"
	^ GRNullCodecStream on: aWriteStream
]

{ #category : #accessing }
GRNullCodec >> name [
	^ GRNullCodec codecName
]

{ #category : #accessing }
GRNullCodec >> url [
	"The selfish method. Let's do it with ourselves."
	
	^ self
]
