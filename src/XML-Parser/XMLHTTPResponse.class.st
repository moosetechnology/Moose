"
This is an abstract base class for HTTP responses.
"
Class {
	#name : #XMLHTTPResponse,
	#superclass : #XMLHTTPMessage,
	#instVars : [
		'request'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPResponse class >> canBeImplemented [
	^ true
]

{ #category : #finding }
XMLHTTPResponse class >> noSupportedImplementationFound [
	XMLHTTPRequest noSupportedImplementationFound
]

{ #category : #defaults }
XMLHTTPResponse class >> preferredImplementation [
	^ XMLHTTPZincResponse
]

{ #category : #'instance creation' }
XMLHTTPResponse class >> request: aRequest [
	^ self new setRequest: aRequest
]

{ #category : #defaults }
XMLHTTPResponse >> contentReaderClass [
	self subclassResponsibility
]

{ #category : #defaults }
XMLHTTPResponse >> defaultProtocol [
	^ 'HTTP/1.1'
]

{ #category : #defaults }
XMLHTTPResponse >> defaultStatusCode [
	^ 200
]

{ #category : #testing }
XMLHTTPResponse >> isChunked [
	^ (self
		headerAt: 'Transfer-Encoding'
		ifAbsent: [^ false]) beginsWith: 'chunked'
]

{ #category : #testing }
XMLHTTPResponse >> isSuccess [
	self subclassResponsibility
]

{ #category : #'instance creation' }
XMLHTTPResponse >> newContentReader [
	^ self contentReaderClass response: self
]

{ #category : #printing }
XMLHTTPResponse >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self statusLine;
		nextPut: $).
]

{ #category : #accessing }
XMLHTTPResponse >> protocol [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPResponse >> protocol: aString [
	self
		setProtocol: aString
		statusCode: self statusCode
]

{ #category : #reading }
XMLHTTPResponse >> readContentUpToLimit: aMaxSize decoding: aBoolean [
	self content:
		(self newContentReader
			readUpToLimit: aMaxSize
			decoding: aBoolean)
]

{ #category : #converting }
XMLHTTPResponse >> readStream [
	^ self content readStream
]

{ #category : #accessing }
XMLHTTPResponse >> request [
	"Returns the XMLHTTPRequest object that created this response"

	^ request
]

{ #category : #initialization }
XMLHTTPResponse >> setProtocol: aString statusCode: anInteger [
	self subclassResponsibility
]

{ #category : #initialization }
XMLHTTPResponse >> setRequest: aRequest [
	request := aRequest
]

{ #category : #accessing }
XMLHTTPResponse >> statusCode [
	"Returns the status code as an integer"

	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPResponse >> statusCode: anInteger [
	self
		setProtocol: self protocol
		statusCode: anInteger
]

{ #category : #accessing }
XMLHTTPResponse >> statusDescription [
	| delimiter |

	delimiter := Character space.
	^ (self statusLine copyAfter: delimiter)
		copyAfter: delimiter
]

{ #category : #accessing }
XMLHTTPResponse >> statusLine [
	"Returns the status line as a string"

	self subclassResponsibility
]
