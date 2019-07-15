"
This class is a resolver that maps entity URIs to string replacements so resolution can be done without HTTP or file access. Used during testing.
"
Class {
	#name : #DTDStaticExternalEntityResolver,
	#superclass : #DTDExternalEntityResolver,
	#instVars : [
		'externalEntities'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDStaticExternalEntityResolver class >> externalEntities: anAssociationCollection [
	^ self new externalEntities: anAssociationCollection
]

{ #category : #private }
DTDStaticExternalEntityResolver >> errorMaxExternalEntitySize: aMaxSize exceededByURI: anXMLURIOrURIString [
	XMLLimitException
		formatSignal: 'Entity exceeds max size of {1} bytes: {2}'
		with: aMaxSize
		with: anXMLURIOrURIString asString
]

{ #category : #private }
DTDStaticExternalEntityResolver >> errorUnresolvableExternalEntityURI: anXMLURIOrURIString [
	XMLParserException
		formatSignal: 'Unresolvable external entity URI: {1}'
		with: anXMLURIOrURIString asString
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntities [
	^ externalEntities ifNil: [externalEntities := Dictionary new]
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntities: anAssociationCollection [
	self hasExternalEntities
		ifTrue: [self removeExternalEntities].
	anAssociationCollection associationsDo: [:each |
		self
			externalEntityAtURI: each key
			put: each value].
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntityAtURI: anXMLURIOrURIString [
	^ self
		externalEntityAtURI: anXMLURIOrURIString asXMLURI
		ifAbsent: ['']
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntityAtURI: anXMLURIOrURIString ifAbsent: aBlock [
	^ self externalEntities
		at: anXMLURIOrURIString asXMLURI
		ifAbsent: aBlock
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntityAtURI: anXMLURIOrURIString ifAbsentPut: aBlock [
	^ self externalEntities
		at: anXMLURIOrURIString asXMLURI
		ifAbsentPut: aBlock
]

{ #category : #accessing }
DTDStaticExternalEntityResolver >> externalEntityAtURI: anXMLURIOrURIString put: aReplacement [
	^ self externalEntities
		at: anXMLURIOrURIString asXMLURI
		put: aReplacement
]

{ #category : #testing }
DTDStaticExternalEntityResolver >> hasExternalEntities [
	^ self externalEntities notEmpty
]

{ #category : #testing }
DTDStaticExternalEntityResolver >> includesExternalEntityURI: anXMLURIOrURIString [
	^ self externalEntities includesKey: anXMLURIOrURIString asXMLURI
]

{ #category : #copying }
DTDStaticExternalEntityResolver >> postCopy [
	super postCopy.

	externalEntities
		ifNotNil: [externalEntities := externalEntities copy].
]

{ #category : #removing }
DTDStaticExternalEntityResolver >> removeExternalEntities [
	self externalEntities removeAll
]

{ #category : #removing }
DTDStaticExternalEntityResolver >> removeExternalEntityURI: anXMLURIOrURIString [
	^ self externalEntities removeKey: anXMLURIOrURIString asXMLURI
]

{ #category : #removing }
DTDStaticExternalEntityResolver >> removeExternalEntityURI: anXMLURIOrURIString ifAbsent: aBlock [
	^ self externalEntities
		removeKey: anXMLURIOrURIString asXMLURI
		ifAbsent: aBlock
]

{ #category : #resolving }
DTDStaticExternalEntityResolver >> resolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	| replacement |

	replacement :=
		self
			externalEntityAtURI: anXMLURIOrURIString
			ifAbsent: [
				self errorUnresolvableExternalEntityURI: anXMLURIOrURIString].

	(aMaxSize notNil
		and: [replacement size > aMaxSize])
		ifTrue: [
			self
				errorMaxExternalEntitySize: aMaxSize
				exceededByURI: anXMLURIOrURIString].
	
	^ DTDUndecodedResolvedExternalParsedEntityReplacement rawContents: replacement.
]

{ #category : #resolving }
DTDStaticExternalEntityResolver >> streamResolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	^ (self
		resolveExternalEntityURI: anXMLURIOrURIString
		upToLimit: aMaxSize) readStream
]
