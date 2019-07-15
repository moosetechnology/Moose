"
This class is a decorator for DTDExternalEntityResolvers that limits the number of entities that can be resolved. This is not handled directly by resolvers to make them less stateful and more reusable.
"
Class {
	#name : #DTDExternalEntityResolverLimitingDecorator,
	#superclass : #Object,
	#instVars : [
		'externalEntityResolver',
		'totalResolvedExternalEntities'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDExternalEntityResolverLimitingDecorator class >> externalEntityResolver: anExternalEntityResolver [
	^ self new externalEntityResolver: anExternalEntityResolver
]

{ #category : #converting }
DTDExternalEntityResolverLimitingDecorator >> asLimitingExternalEntityResolver [
	^ self
]

{ #category : #private }
DTDExternalEntityResolverLimitingDecorator >> checkExternalEntityLimit [
	| maxExternalEntities |

	((maxExternalEntities := self externalEntityResolver maxExternalEntities) notNil
		and: [self totalResolvedExternalEntities >= maxExternalEntities])
		ifTrue: [self erorrExternalEntityLimitExceeded]
]

{ #category : #private }
DTDExternalEntityResolverLimitingDecorator >> erorrExternalEntityLimitExceeded [
	XMLLimitException signal:
		'External entity limit exceeded; ',
		'use #maxExternalEntities: to change or disable'
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> externalEntityLimits [
	^ self externalEntityResolver externalEntityLimits
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> externalEntityLimits: anExternalEntityLimits [
	self externalEntityResolver externalEntityLimits: anExternalEntityLimits
]

{ #category : #accessing }
DTDExternalEntityResolverLimitingDecorator >> externalEntityResolver [
	^ externalEntityResolver
]

{ #category : #accessing }
DTDExternalEntityResolverLimitingDecorator >> externalEntityResolver: anExternalEntityResolver [
	externalEntityResolver := anExternalEntityResolver
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> externalEntityURIFromPublicID: aPublicID systemID: aSystemID [
	^ self externalEntityResolver
		externalEntityURIFromPublicID: aPublicID
		systemID: aSystemID
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> externalEntityURIFromPublicID: aPublicID systemID: aSystemID baseURI: aBaseXMLURIOrURIString [
	^ self externalEntityResolver
		externalEntityURIFromPublicID: aPublicID
		systemID: aSystemID
		baseURI: aBaseXMLURIOrURIString
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> externalSubsetReadLimit [
	^ self externalEntityResolver externalSubsetReadLimit
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> externalSubsetReadLimit: anInteger [
	self externalEntityResolver externalSubsetReadLimit: anInteger
]

{ #category : #private }
DTDExternalEntityResolverLimitingDecorator >> incrementTotalResolvedExternalEntities [
	totalResolvedExternalEntities :=
		totalResolvedExternalEntities
			ifNil: [1]
			ifNotNil: [totalResolvedExternalEntities + 1]
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> maxExternalEntities [
	^ self externalEntityResolver maxExternalEntities
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> maxExternalEntities: anInteger [
	self externalEntityResolver maxExternalEntities: anInteger
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> maxExternalEntitySize [
	^ self externalEntityResolver maxExternalEntitySize
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> maxExternalEntitySize: anInteger [
	self externalEntityResolver maxExternalEntitySize: anInteger
]

{ #category : #printing }
DTDExternalEntityResolverLimitingDecorator >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self externalEntityResolver;
		nextPut: $).
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> removeLimits [
	self externalEntityResolver removeLimits
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> resolveExternalEntityURI: anXMLURIOrURIString [
	^ self resolveExternalEntityWith: [
		self externalEntityResolver resolveExternalEntityURI:
			anXMLURIOrURIString]
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> resolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	^ self resolveExternalEntityWith: [
		self externalEntityResolver
			resolveExternalEntityURI: anXMLURIOrURIString
			upToLimit: aMaxSize]
]

{ #category : #private }
DTDExternalEntityResolverLimitingDecorator >> resolveExternalEntityWith: aBlock [
	| result |

	self checkExternalEntityLimit.
	result := aBlock value.
	self incrementTotalResolvedExternalEntities.

	^ result.
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> resolvesLocalFromNonLocal [
	^ self externalEntityResolver resolvesLocalFromNonLocal
]

{ #category : #configuring }
DTDExternalEntityResolverLimitingDecorator >> resolvesLocalFromNonLocal: aBoolean [
	self externalEntityResolver resolvesLocalFromNonLocal: aBoolean
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> streamResolveExternalEntityURI: anXMLURIOrURIString [
	^ self resolveExternalEntityWith: [
		self externalEntityResolver streamResolveExternalEntityURI:
			anXMLURIOrURIString]
]

{ #category : #resolving }
DTDExternalEntityResolverLimitingDecorator >> streamResolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	^ self resolveExternalEntityWith: [
		self externalEntityResolver
			streamResolveExternalEntityURI: anXMLURIOrURIString
			upToLimit: aMaxSize]
]

{ #category : #accessing }
DTDExternalEntityResolverLimitingDecorator >> totalResolvedExternalEntities [
	^ totalResolvedExternalEntities ifNil: [totalResolvedExternalEntities := 0]
]
