"
This is an abstract base class for unresolvable external parsed entities that lazily raises an error when #replacement or #replacementStream is sent, which would normally trigger resolution.
"
Class {
	#name : #DTDUnresolvableExternalParsedEntity,
	#superclass : #DTDParsedEntity,
	#category : #'XML-Parser-DTD'
}

{ #category : #private }
DTDUnresolvableExternalParsedEntity >> errorUnresolvableExternalEntity [
	XMLParserException
		formatSignal:
			'External entity {1} can''t be resolved unless resolution is ',
			'enabled; use #resolvesExternalEntityReferences: before parsing ',
			'to enable'
		with: self asReference
]

{ #category : #testing }
DTDUnresolvableExternalParsedEntity >> hasReplacement [
	^ true
]

{ #category : #testing }
DTDUnresolvableExternalParsedEntity >> isExternal [
	^ true
]

{ #category : #accessing }
DTDUnresolvableExternalParsedEntity >> replacement [
	self errorUnresolvableExternalEntity
]

{ #category : #accessing }
DTDUnresolvableExternalParsedEntity >> replacementStream [
	self errorUnresolvableExternalEntity
]
