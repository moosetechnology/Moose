"
This class stores an entity resolver and the public ID, system ID, and base URI of an external entity so its replacement can be lazily resolved only if the entity is referenced.
"
Class {
	#name : #DTDUnresolvedExternalParsedEntityReplacement,
	#superclass : #Object,
	#instVars : [
		'resolver',
		'publicID',
		'systemID',
		'baseURI'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDUnresolvedExternalParsedEntityReplacement class >> resolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	^ self new
		setResolver: aResolver
		publicID: aPublicID
		systemID: aSystemID
		baseURI: aBaseURIString
]

{ #category : #accessing }
DTDUnresolvedExternalParsedEntityReplacement >> baseURI [
	^ baseURI ifNil: [baseURI := '']
]

{ #category : #printing }
DTDUnresolvedExternalParsedEntityReplacement >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self publicID isEmpty
		ifTrue: [aStream nextPutAll: 'SYSTEM']
		ifFalse: [
			aStream
				nextPutAll: 'PUBLIC "';
				nextPutAll: self publicID;
				nextPut: $"].

	aStream
		nextPutAll: ' "';
		nextPutAll: self systemID;
		nextPutAll: '")'.
]

{ #category : #accessing }
DTDUnresolvedExternalParsedEntityReplacement >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #resolving }
DTDUnresolvedExternalParsedEntityReplacement >> resolveForExternalEntity: anExternalEntity [
	| externalEntityURI |

	externalEntityURI :=
		self resolver
			externalEntityURIFromPublicID: self publicID
			systemID: self systemID
			baseURI: self baseURI.

	anExternalEntity
		resolvedReplacement:
			(self resolver resolveExternalEntityURI: externalEntityURI);
		uri: externalEntityURI asString;
		unresolvedReplacement: nil.
]

{ #category : #accessing }
DTDUnresolvedExternalParsedEntityReplacement >> resolver [
	^ resolver ifNil: [resolver := DTDExternalEntityResolver default]
]

{ #category : #initialization }
DTDUnresolvedExternalParsedEntityReplacement >> setResolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	resolver := aResolver.
	publicID := aPublicID.
	systemID := aSystemID.
	baseURI := aBaseURIString.
]

{ #category : #accessing }
DTDUnresolvedExternalParsedEntityReplacement >> systemID [
	^ systemID ifNil: [systemID := '']
]
