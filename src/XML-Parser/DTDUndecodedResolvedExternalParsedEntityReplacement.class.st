"
This class stores the undecoded resolved replacement of an external parsed entity as well as its likely encoding.
"
Class {
	#name : #DTDUndecodedResolvedExternalParsedEntityReplacement,
	#superclass : #DTDResolvedExternalParsedEntityReplacement,
	#instVars : [
		'rawContents',
		'encoding'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDUndecodedResolvedExternalParsedEntityReplacement class >> rawContents: aString [
	^ self
		rawContents: aString
		encoding: ''
]

{ #category : #'instance creation' }
DTDUndecodedResolvedExternalParsedEntityReplacement class >> rawContents: aString encoding: anEncodingName [
	^ self new
		setRawContents: aString
		encoding: anEncodingName
]

{ #category : #accessing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> contents [
	^ self readStream upToEnd
]

{ #category : #accessing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> encoding [
	^ encoding
]

{ #category : #testing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> isEmpty [
	^ self rawContents isEmpty
]

{ #category : #printing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self encoding;
		nextPut: $).
]

{ #category : #accessing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> rawContents [
	^ rawContents
]

{ #category : #accessing }
DTDUndecodedResolvedExternalParsedEntityReplacement >> readStream [
	^ XMLDecodingReadStreamAdapter
		on: self rawContents readStream
		streamConverter: self encoding asXMLStreamConverter
]

{ #category : #initialization }
DTDUndecodedResolvedExternalParsedEntityReplacement >> setRawContents: aString encoding: anEncodingName [
	rawContents := aString.
	encoding := anEncodingName.
]
