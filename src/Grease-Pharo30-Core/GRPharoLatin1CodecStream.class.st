"
A GRPharoLatin1CodecStream is a WACodecStream optimized for ISO-8859-1 (direct byte to character mapping).
"
Class {
	#name : #GRPharoLatin1CodecStream,
	#superclass : #GRNullCodecStream,
	#category : #'Grease-Pharo30-Core'
}

{ #category : #streaming }
GRPharoLatin1CodecStream >> next [
	^ Character value: stream next
]

{ #category : #streaming }
GRPharoLatin1CodecStream >> next: anInteger [
	^ (stream next: anInteger) asString
]
