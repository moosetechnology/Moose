"
This class contains configurations for entity replacement/retrieval. It is separate from XMLConfiguration so it is only lazy initialized when needed and saves memory.
"
Class {
	#name : #DTDEntityConfiguration,
	#superclass : #Object,
	#instVars : [
		'replacesContentEntityReferences',
		'resolvesExternalEntities',
		'preservesUndeclaredEntityReferences',
		'externalEntityResolver'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #accessing }
DTDEntityConfiguration >> externalEntityResolver [
	"uses the caching resolver by default"
	^ externalEntityResolver
		ifNil: [externalEntityResolver := DTDExternalEntityResolver default]
]

{ #category : #accessing }
DTDEntityConfiguration >> externalEntityResolver: anExternalEntityResolver [
	externalEntityResolver := anExternalEntityResolver
]

{ #category : #copying }
DTDEntityConfiguration >> postCopy [
	super postCopy.

	externalEntityResolver
		ifNotNil: [externalEntityResolver := externalEntityResolver copy].
]

{ #category : #accessing }
DTDEntityConfiguration >> preservesUndeclaredEntityReferences [
	^ preservesUndeclaredEntityReferences
		ifNil: [preservesUndeclaredEntityReferences := false]
]

{ #category : #accessing }
DTDEntityConfiguration >> preservesUndeclaredEntityReferences: aBoolean [
	preservesUndeclaredEntityReferences := aBoolean
]

{ #category : #accessing }
DTDEntityConfiguration >> replacesContentEntityReferences [
	^ replacesContentEntityReferences ifNil: [replacesContentEntityReferences := true]
]

{ #category : #accessing }
DTDEntityConfiguration >> replacesContentEntityReferences: aBoolean [
	replacesContentEntityReferences := aBoolean
]

{ #category : #accessing }
DTDEntityConfiguration >> resolvesExternalEntities [
	^ resolvesExternalEntities ifNil: [resolvesExternalEntities := false]
]

{ #category : #accessing }
DTDEntityConfiguration >> resolvesExternalEntities: aBoolean [
	resolvesExternalEntities := aBoolean
]
