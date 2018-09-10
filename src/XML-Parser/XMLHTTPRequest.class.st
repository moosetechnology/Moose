"
This is an abstract base class for HTTP requests.

These classes implement the #get/#getUpToLimit:decoding: and #streamGet/#streamGetUpToLimit:decoding: interface of XMLURI.
"
Class {
	#name : #XMLHTTPRequest,
	#superclass : #XMLHTTPMessage,
	#instVars : [
		'url'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPRequest class >> canBeImplemented [
	^ true
]

{ #category : #'instance creation' }
XMLHTTPRequest class >> new [
	^ self url: ''
]

{ #category : #finding }
XMLHTTPRequest class >> noSupportedImplementationFound [
	XMLHTTPException signal: 'HTTP unsupported; install Zinc or WebClient'
]

{ #category : #defaults }
XMLHTTPRequest class >> preferredImplementation [
	^ XMLHTTPZincRequest
]

{ #category : #'instance creation' }
XMLHTTPRequest class >> url: aURLString [
	^ self implementationNew setURL: aURLString
]

{ #category : #accessing }
XMLHTTPRequest >> acceptEncoding [
	^ self encodingNamesFromHeaderValuesAt: 'Accept-Encoding'
]

{ #category : #accessing }
XMLHTTPRequest >> acceptEncoding: aStringOrCollection [
	"NOTE: only gzip is currently supported"
	self
		encodingNamesFromHeaderValuesAt: 'Accept-Encoding'
		put: aStringOrCollection
]

{ #category : #converting }
XMLHTTPRequest >> asXMLHTTPRequest [
	^ self
]

{ #category : #basic }
XMLHTTPRequest >> basicCleanup [
	"can be overridden to handle cleanup after sending the
	request and reading the response"
]

{ #category : #basic }
XMLHTTPRequest >> basicSend [
	self subclassResponsibility
]

{ #category : #defaults }
XMLHTTPRequest >> defaultAcceptEncoding [
	^ #()
]

{ #category : #defaults }
XMLHTTPRequest >> defaultMethod [
	^ 'GET'
]

{ #category : #defaults }
XMLHTTPRequest >> defaultTimeout [
	^ 30
]

{ #category : #accessing }
XMLHTTPRequest >> enableCompression [
	"NOTE: only gzip is currently supported"
	self acceptEncoding: 'gzip'
]

{ #category : #private }
XMLHTTPRequest >> errorBadResponse: aResponse [
	XMLHTTPException
		formatSignal: '{1} ({2})'
		with: aResponse statusDescription
		with: aResponse statusCode
]

{ #category : #resolving }
XMLHTTPRequest >> get [
	^ self
		getUpToLimit: nil
		decoding: true
]

{ #category : #resolving }
XMLHTTPRequest >> getUpToLimit: aMaxSize decoding: aBoolean [
	self method: 'GET'.
	^ (self
		resolveUpToLimit: aMaxSize
		decoding: aBoolean) content
]

{ #category : #accessing }
XMLHTTPRequest >> method [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPRequest >> method: aString [
	self subclassResponsibility
]

{ #category : #printing }
XMLHTTPRequest >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self method;
		space;
		nextPutAll: self url;
		nextPut: $).
]

{ #category : #'resolving - response' }
XMLHTTPRequest >> resolve [
	"Sends and retrieves the response as an XMLHTTPResponse object."

	^ self
		resolveUpToLimit: nil
		decoding: true
]

{ #category : #'resolving - response' }
XMLHTTPRequest >> resolveUpToLimit: aMaxSize decoding: aBoolean [
	| response |

	[
		[
			(response := self basicSend) isSuccess
				ifFalse: [self errorBadResponse: response].
			response
				readContentUpToLimit: aMaxSize
				decoding: aBoolean]
			on: Error
			do: [:error |
				error isXMLParserException
					ifTrue: [error pass]
					ifFalse: [XMLHTTPException signalMessageFrom: error]]
		] ensure: [self basicCleanup].

	^ response.
]

{ #category : #defaults }
XMLHTTPRequest >> responseClass [
	self subclassResponsibility
]

{ #category : #initialization }
XMLHTTPRequest >> setURL: aURLString [
	url := aURLString.
	self
		timeout: self defaultTimeout;
		method: self defaultMethod;
		"even if #defaultAcceptEncoding returns an empty collection,
		#acceptEncoding: must still be sent here to override any default
		setting of the underlying HTTP library that we don't support"
		acceptEncoding: self defaultAcceptEncoding.
]

{ #category : #resolving }
XMLHTTPRequest >> streamGet [
	^ self
		streamGetUpToLimit: nil
		decoding: true
]

{ #category : #resolving }
XMLHTTPRequest >> streamGetUpToLimit: aMaxSize decoding: aBoolean [
	"must be implemented using getUpToLimit:decoding: rather than the other
	way around like XMLFileHandle does, because HTTP responses must be read
	immediately and stored entirely in memory, unlike a file stream which
	can safely be left open and read from incrementally"
	^ (self
		getUpToLimit: aMaxSize
		decoding: aBoolean) readStream
]

{ #category : #accessing }
XMLHTTPRequest >> timeout [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPRequest >> timeout: anInteger [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPRequest >> url [
	^ url ifNil: [url := '']
]
