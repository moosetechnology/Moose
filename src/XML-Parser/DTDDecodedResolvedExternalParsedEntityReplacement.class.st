"
This class stores the decoded resolved replacement of an external parsed entity.
"
Class {
	#name : #DTDDecodedResolvedExternalParsedEntityReplacement,
	#superclass : #DTDResolvedExternalParsedEntityReplacement,
	#instVars : [
		'contents'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDDecodedResolvedExternalParsedEntityReplacement class >> contents: aString [
	^ self new setContents: aString
]

{ #category : #accessing }
DTDDecodedResolvedExternalParsedEntityReplacement >> contents [
	^ contents
]

{ #category : #testing }
DTDDecodedResolvedExternalParsedEntityReplacement >> isEmpty [
	^ self contents isEmpty
]

{ #category : #printing }
DTDDecodedResolvedExternalParsedEntityReplacement >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self contents;
		nextPut: $).
]

{ #category : #accessing }
DTDDecodedResolvedExternalParsedEntityReplacement >> readStream [
	^ self contents readStream
]

{ #category : #initialization }
DTDDecodedResolvedExternalParsedEntityReplacement >> setContents: aString [
	contents := aString
]
