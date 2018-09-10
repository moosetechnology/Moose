"
This is an abstract base class for external parsed entities with external replacements that can be inserted into an XML document.

The external replacements are resolved lazily the first time #replacement or #replacementStream is sent.
"
Class {
	#name : #DTDExternalParsedEntity,
	#superclass : #DTDParsedEntity,
	#instVars : [
		'unresolvedReplacement',
		'resolvedReplacement'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDExternalParsedEntity class >> name: aName resolver: aResolver publicID: aPublicID systemID: aSystemID baseURI: aBaseURIString [
	^ self new
		setName: aName
		unresolvedReplacement:
			(DTDUnresolvedExternalParsedEntityReplacement
				resolver: aResolver
				publicID: aPublicID
				systemID: aSystemID
				baseURI: aBaseURIString)
]

{ #category : #testing }
DTDExternalParsedEntity >> hasReplacement [
	^ self resolvedReplacement notEmpty
]

{ #category : #testing }
DTDExternalParsedEntity >> hasUnresolvedReplacement [
	^ self unresolvedReplacement notNil
]

{ #category : #testing }
DTDExternalParsedEntity >> isExternal [
	^ true
]

{ #category : #printing }
DTDExternalParsedEntity >> printNameOn: aStream [
	aStream
		nextPut: ${;
		nextPutAll: self uri;
		nextPut: $}.
	super printNameOn: aStream.
]

{ #category : #accessing }
DTDExternalParsedEntity >> replacement [
	^ self resolvedReplacement contents
]

{ #category : #accessing }
DTDExternalParsedEntity >> replacementStream [
	^ self resolvedReplacement readStream
]

{ #category : #resolving }
DTDExternalParsedEntity >> resolveUnresolvedReplacement [
	self hasUnresolvedReplacement
		ifTrue: [self unresolvedReplacement resolveForExternalEntity: self]
]

{ #category : #accessing }
DTDExternalParsedEntity >> resolvedReplacement [
	self resolveUnresolvedReplacement.
	^ resolvedReplacement.
]

{ #category : #accessing }
DTDExternalParsedEntity >> resolvedReplacement: aResolvedReplacement [
	resolvedReplacement := aResolvedReplacement
]

{ #category : #initialization }
DTDExternalParsedEntity >> setName: aName unresolvedReplacement: anUnresolvedReplacement [
	name := aName.
	unresolvedReplacement := anUnresolvedReplacement.
]

{ #category : #accessing }
DTDExternalParsedEntity >> unresolvedReplacement [
	^ unresolvedReplacement
]

{ #category : #accessing }
DTDExternalParsedEntity >> unresolvedReplacement: anUnresolvedReplacement [
	unresolvedReplacement := anUnresolvedReplacement
]
