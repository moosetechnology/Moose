Class {
	#name : #XMLHTTPResponseTest,
	#superclass : #XMLHTTPMessageTest,
	#category : #'XML-Tests-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPResponseTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLHTTPResponseTest >> messageClass [
	^ XMLHTTPResponse
]

{ #category : #tests }
XMLHTTPResponseTest >> testProtocol [
	| response |

	self isSupported
		ifFalse: [^ self].

	response := self newMessage.
	self
		assert: response protocol = 'HTTP/1.1';
		assert: (response protocol: 'HTTP/1.0') == response;
		assert: response protocol = 'HTTP/1.0'.
]

{ #category : #tests }
XMLHTTPResponseTest >> testStatusCode [
	| response |

	self isSupported
		ifFalse: [^ self].

	response := self newMessage.
	self
		assert: response statusCode = 200;
		assert: (response statusCode: 404) == response;
		assert: response statusCode = 404.
]

{ #category : #tests }
XMLHTTPResponseTest >> testStatusDescription [
	| response |

	self isSupported
		ifFalse: [^ self].

	response := self newMessage.
	self assert: response statusDescription = 'OK'.
	
	response statusCode: 404.
	self assert: response statusDescription = 'Not Found'.
]

{ #category : #tests }
XMLHTTPResponseTest >> testStatusLine [
	| response |

	self isSupported
		ifFalse: [^ self].

	response := self newMessage.
	self assert: response statusLine = 'HTTP/1.1 200 OK'.

	response statusCode: 404.
	self assert: response statusLine = 'HTTP/1.1 404 Not Found'.

	response protocol: 'HTTP/1.0'.
	self assert: response statusLine = 'HTTP/1.0 404 Not Found'.
]
