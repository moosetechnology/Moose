Class {
	#name : #XMLHTTPRequestTest,
	#superclass : #XMLHTTPMessageTest,
	#category : #'XML-Tests-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPRequestTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLHTTPRequestTest >> defaultTimeout [
	^ 30
]

{ #category : #accessing }
XMLHTTPRequestTest >> messageClass [
	^ XMLHTTPRequest
]

{ #category : #'instance creation' }
XMLHTTPRequestTest >> newMessage [
	^ self newRequestWithURL
]

{ #category : #'instance creation' }
XMLHTTPRequestTest >> newRequestWithURL [
	^ self messageClass url: self url
]

{ #category : #tests }
XMLHTTPRequestTest >> testAcceptEncoding [
	| request defaultValue absentValue |

	self isSupported
		ifFalse: [^ self].

	request := self newRequestWithURL.
	defaultValue := request defaultAcceptEncoding asOrderedCollection.
	absentValue := OrderedCollection new.
	self
		assert: request acceptEncoding sorted = defaultValue sorted;
		assert: (request acceptEncoding: 'one') == request;
		assert: request acceptEncoding = #('one') asOrderedCollection;
		assert: (request acceptEncoding: ' one, identity, two') == request;
		assert: request acceptEncoding = #('one' 'two') asOrderedCollection;
		assert: (request acceptEncoding: #('one')) == request;
		assert: request acceptEncoding = #('one') asOrderedCollection;
		assert: (request acceptEncoding: #('one' 'identity' 'two')) == request;
		assert: request acceptEncoding = #('one' 'two') asOrderedCollection;
		assert: (request acceptEncoding: '') == request;
		assert: request acceptEncoding = absentValue;
		assert: (request acceptEncoding: #()) == request;
		assert: request acceptEncoding = absentValue.

	request
		headerAt: 'Accept-Encoding'
		put: 'identity,one,identity,two,identity,three,identity'.
	self assert:
		request acceptEncoding =
			#('one' 'two' 'three') asOrderedCollection.

	request removeHeaderAt: 'Accept-Encoding'.
	self assert: request acceptEncoding = absentValue.
]

{ #category : #tests }
XMLHTTPRequestTest >> testAsXMLHTTPRequest [
	| request |

	self isSupported
		ifFalse: [^ self].

	request := self newMessage.
	self assert: request asXMLHTTPRequest == request.
]

{ #category : #tests }
XMLHTTPRequestTest >> testEnableCompression [
	| request  |

	self isSupported
		ifFalse: [^ self].

	(request := self newRequestWithURL) acceptEncoding: ''.
	self
		assert: request enableCompression == request;
		deny: request acceptEncoding isEmpty.
	request acceptEncoding do: [:each |
		self assert:
			(XMLHTTPDecompressingReadStreamAdapterFactory
				classForCompression: each) notNil].
]

{ #category : #tests }
XMLHTTPRequestTest >> testMethod [
	| request |

	self isSupported
		ifFalse: [^ self].

	request := self newMessage.
	self
		assert: request method = 'GET';
		deny: request method isSymbol;
		assert: (request method: 'POST') == request;
		assert: request method = 'POST';
		deny: request method isSymbol.
]

{ #category : #tests }
XMLHTTPRequestTest >> testTimeout [
	| request |

	self isSupported
		ifFalse: [^ self].

	request := self newMessage.
	self
		assert: request timeout = self defaultTimeout;
		assert: (request timeout: self defaultTimeout + 1) == request;
		assert: request timeout = (self defaultTimeout + 1).
]

{ #category : #tests }
XMLHTTPRequestTest >> testURL [
	self isSupported
		ifFalse: [^ self].

	self assert: self newRequestWithURL url = self url.
]

{ #category : #accessing }
XMLHTTPRequestTest >> url [
	^ 'http://pharo.org'
]
