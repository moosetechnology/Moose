"
This is an abstract base class for response content readers. The #readUpToLimit:decoding: message returns the entire  decoded (if enabled) response content, raising an XMLLimitException if it exceeds the specified limit.

Subclasses need to implement #rawReadWithLength:upToLimit: to read and return the raw response content and signal an error if it exceeds the limit.
"
Class {
	#name : #XMLHTTPResponseContentReader,
	#superclass : #Object,
	#instVars : [
		'response',
		'rawContent',
		'contentReadStream',
		'limitedContentReadStream',
		'isDecompressing'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #accessing }
XMLHTTPResponseContentReader class >> response: aResponse [
	^ self new setResponse: aResponse
]

{ #category : #private }
XMLHTTPResponseContentReader >> contentReadStreamUpToEnd [
	| contentWriteStream |

	contentWriteStream := self newContentWriteStream.
	[contentReadStream atEnd]
		whileFalse: [contentWriteStream nextPut: contentReadStream next].
	^ contentWriteStream contents.
]

{ #category : #private }
XMLHTTPResponseContentReader >> decodedContentReadStreamUpToEndWithCharset: aCharset [
	| streamConverter |

	(streamConverter := aCharset asXMLStreamConverter) isNull
		ifTrue: [self errorUnrecognizedContentTypeCharset: aCharset].

	contentReadStream :=
		XMLDecodingReadStreamAdapter
			on: contentReadStream
			streamConverter: streamConverter.

	[^ self contentReadStreamUpToEnd]
		on: XMLEncodingException
		do: [:error |
			"might actually be a limit exception"
			self ensureContentReadStreamWasNotLimited.

			error pass].
]

{ #category : #private }
XMLHTTPResponseContentReader >> ensureContentReadStreamWasNotLimited [
	(limitedContentReadStream notNil
		and: [limitedContentReadStream atLimitedEnd])
		ifTrue: [self errorContentLimitExceeded]
]

{ #category : #private }
XMLHTTPResponseContentReader >> errorContentLimitExceeded [
	XMLLimitException signal: 'HTTP reponse content limit exceeded'
]

{ #category : #private }
XMLHTTPResponseContentReader >> errorUnrecognizedContentTypeCharset: aCharset [
	XMLEncodingException
		formatSignal:
			'Unrecognized Content-Type charset "{1}" encoding for HTTP content'
		with: aCharset
]

{ #category : #testing }
XMLHTTPResponseContentReader >> handlesDecompression [
	^ false
]

{ #category : #initialization }
XMLHTTPResponseContentReader >> initializeDecompressionWithSchemes: aCompressionSchemeSequence upToLimit: aMaxSize [
	isDecompressing := true.
	aCompressionSchemeSequence reverseDo: [:each |
		contentReadStream :=
			XMLHTTPDecompressingReadStreamAdapterFactory
				on: contentReadStream
				compression: each].
	aMaxSize
		ifNotNil: [self limitContentReadStreamUpToLimit: aMaxSize].
]

{ #category : #accessing }
XMLHTTPResponseContentReader >> limitContentReadStreamUpToLimit: aMaxSize [
	limitedContentReadStream :=
		XMLLimitedReadStreamAdapter
			on: contentReadStream
			limit: aMaxSize.
	contentReadStream := limitedContentReadStream.
]

{ #category : #'instance creation' }
XMLHTTPResponseContentReader >> newContentWriteStream [
	^ (String new: rawContent size) writeStream
]

{ #category : #reading }
XMLHTTPResponseContentReader >> rawReadWithLength: aContentLength upToLimit: aMaxSize [
	self subclassResponsibility
]

{ #category : #reading }
XMLHTTPResponseContentReader >> readUpToLimit: aMaxSize decoding: aBoolean [
	| contentLength contentType compressionSchemes charset content |

	contentLength := response contentLength.
	(response isChunked
		or: [contentLength isNil])
		ifTrue: [contentLength := nil]
		ifFalse: [
			contentLength > 0
				ifFalse: [^ ''].
			(aMaxSize notNil
				and: [contentLength > aMaxSize])
				ifTrue: [self errorContentLimitExceeded]].
	rawContent :=
		self
			rawReadWithLength: contentLength
			upToLimit: aMaxSize.
	contentReadStream := rawContent readStream.

	(self handlesDecompression
		and: [(compressionSchemes := response contentEncoding) notEmpty])
		ifTrue: [
			self
				initializeDecompressionWithSchemes: compressionSchemes
				upToLimit: aMaxSize].

	(aBoolean
		and: [(contentType := response contentType) notNil
			and: [(charset := contentType charset) ~= contentType defaultCharset]])
		ifTrue: [
			content := self decodedContentReadStreamUpToEndWithCharset: charset]
		ifFalse: [
			content := self undecodedContentReadStreamUpToEnd].

	self ensureContentReadStreamWasNotLimited.
	^ content.
]

{ #category : #initialization }
XMLHTTPResponseContentReader >> setResponse: aResponse [
	response := aResponse.
	isDecompressing := false.
]

{ #category : #streaming }
XMLHTTPResponseContentReader >> undecodedContentReadStreamUpToEnd [
	^ (isDecompressing
		or: [limitedContentReadStream notNil])
		ifTrue: [self contentReadStreamUpToEnd]
		ifFalse: [rawContent]
]
