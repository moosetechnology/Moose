"
This class resolves external entity references using XMLURI, XMLHTTPRequest, and XMLFileHandle.

The #externalEntityURIFromPublicID:systemID: and #externalEntityURIFromPublicID:systemID:baseURI: convert public IDs and system IDs into resolvable XMLURI objects.

The #resolveExternalEntityURI: and #streamResolveExternalEntityURI: messages can resolve external entity XMLURIs or URI strings as either a string or a stream on the undecoded entity content. If the entity is in a file, then #streamResolveExternalEntityURI: can be used to avoid storing it in-memory, but if it's fetched over HTTP, it will just return a stream on the entire in-memory HTTP response.
"
Class {
	#name : #DTDExternalEntityResolver,
	#superclass : #Object,
	#instVars : [
		'externalEntityLimits'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDExternalEntityResolver class >> default [
	^ self defaultClass new
]

{ #category : #accessing }
DTDExternalEntityResolver class >> defaultClass [
	^ DTDCachingExternalEntityResolver
]

{ #category : #converting }
DTDExternalEntityResolver >> asLimitingExternalEntityResolver [
	^ DTDExternalEntityResolverLimitingDecorator externalEntityResolver: self
]

{ #category : #private }
DTDExternalEntityResolver >> errorLocalFromNonLocal [
	XMLLimitException signal:
		'Local URI referenced from non-local URI; ',
		'use #resolvesLocalFromNonLocal: to change'
]

{ #category : #configuring }
DTDExternalEntityResolver >> externalEntityLimits [
	^ externalEntityLimits
		ifNil: [externalEntityLimits := DTDExternalEntityLimits new]
]

{ #category : #configuring }
DTDExternalEntityResolver >> externalEntityLimits: anExternalEntityLimits [
	externalEntityLimits := anExternalEntityLimits
]

{ #category : #resolving }
DTDExternalEntityResolver >> externalEntityURIFromPublicID: aPublicID systemID: aSystemID [
	^ aSystemID asXMLURI
]

{ #category : #resolving }
DTDExternalEntityResolver >> externalEntityURIFromPublicID: aPublicID systemID: aSystemID baseURI: aBaseXMLURIOrURIString [
	| baseURI externalEntityURI |

	baseURI := aBaseXMLURIOrURIString asXMLURI.
	externalEntityURI :=
		baseURI combinedWith:
			(self
				externalEntityURIFromPublicID: aPublicID
				systemID: aSystemID).
	(externalEntityURI isLocal
		and: [baseURI isLocal not
			and: [self resolvesLocalFromNonLocal not]])
		ifTrue: [self errorLocalFromNonLocal].

	^ externalEntityURI.
]

{ #category : #configuring }
DTDExternalEntityResolver >> externalSubsetReadLimit [
	^ self externalEntityLimits externalSubsetReadLimit
]

{ #category : #configuring }
DTDExternalEntityResolver >> externalSubsetReadLimit: anInteger [
	"change the external subset read limit or nil to disable"

	self externalEntityLimits externalSubsetReadLimit: anInteger
]

{ #category : #configuring }
DTDExternalEntityResolver >> maxExternalEntities [
	^ self externalEntityLimits maxExternalEntities
]

{ #category : #configuring }
DTDExternalEntityResolver >> maxExternalEntities: anInteger [
	self externalEntityLimits maxExternalEntities: anInteger
]

{ #category : #configuring }
DTDExternalEntityResolver >> maxExternalEntitySize [
	^ self externalEntityLimits maxExternalEntitySize
]

{ #category : #configuring }
DTDExternalEntityResolver >> maxExternalEntitySize: anInteger [
	self externalEntityLimits maxExternalEntitySize: anInteger
]

{ #category : #copying }
DTDExternalEntityResolver >> postCopy [
	super postCopy.

	externalEntityLimits
		ifNotNil: [externalEntityLimits := externalEntityLimits copy].
]

{ #category : #configuring }
DTDExternalEntityResolver >> removeLimits [
	self externalEntityLimits removeAll
]

{ #category : #resolving }
DTDExternalEntityResolver >> resolveExternalEntityURI: anXMLURIOrURIString [
	^ self
		resolveExternalEntityURI: anXMLURIOrURIString
		upToLimit: self maxExternalEntitySize
]

{ #category : #resolving }
DTDExternalEntityResolver >> resolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	| uri |

	^ (uri := anXMLURIOrURIString asXMLURI) isLocal
		ifTrue: [
			self
				resolveLocalExternalEntityURI: uri
				upToLimit: aMaxSize]
		ifFalse: [
			self
				resolveNonLocalExternalEntityURI: uri
				upToLimit: aMaxSize]
]

{ #category : #private }
DTDExternalEntityResolver >> resolveLocalExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	^ DTDUndecodedResolvedExternalParsedEntityReplacement rawContents:
		(anXMLURIOrURIString asXMLFileHandle
			getUpToLimit: aMaxSize
			decoding: false)
]

{ #category : #private }
DTDExternalEntityResolver >> resolveNonLocalExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	| response |

	response :=
		anXMLURIOrURIString asXMLHTTPRequest
			resolveUpToLimit: aMaxSize
			decoding: false.

	"saves the undecoded replacement with its Content-Type
	charset encoding tag for later decoding (if needed)"
	^ DTDUndecodedResolvedExternalParsedEntityReplacement
		rawContents: response content
		encoding: response contentCharset.
]

{ #category : #configuring }
DTDExternalEntityResolver >> resolvesLocalFromNonLocal [
	^ self externalEntityLimits resolvesLocalFromNonLocal
]

{ #category : #configuring }
DTDExternalEntityResolver >> resolvesLocalFromNonLocal: aBoolean [
	"allow non-local (http) entities to reference local (file) entities?
	(default disabled)"

	self externalEntityLimits resolvesLocalFromNonLocal: aBoolean
]

{ #category : #resolving }
DTDExternalEntityResolver >> streamResolveExternalEntityURI: anXMLURIOrURIString [
	^ self
		streamResolveExternalEntityURI: anXMLURIOrURIString
		upToLimit: self maxExternalEntitySize
]

{ #category : #resolving }
DTDExternalEntityResolver >> streamResolveExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	| uri |

	^ (uri := anXMLURIOrURIString asXMLURI) isLocal
		ifTrue: [
			self
				streamResolveLocalExternalEntityURI: uri
				upToLimit: aMaxSize]
		ifFalse: [
			self
				streamResolveNonLocalExternalEntityURI: uri
				upToLimit: aMaxSize]
]

{ #category : #private }
DTDExternalEntityResolver >> streamResolveLocalExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	"return our own decoding adapter on the raw, undecoded stream
	to avoid looking for any byte-order mark until later"
	^ XMLDecodingReadStreamAdapter nonDecodingOn:
		(anXMLURIOrURIString asXMLFileHandle
			streamGetUpToLimit: aMaxSize
			decoding: false)
]

{ #category : #private }
DTDExternalEntityResolver >> streamResolveNonLocalExternalEntityURI: anXMLURIOrURIString upToLimit: aMaxSize [
	^ (self
		resolveNonLocalExternalEntityURI: anXMLURIOrURIString
		upToLimit: aMaxSize) readStream
]
