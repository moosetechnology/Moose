"
This class uses Zinc HTTP Components to implement HTTP responses and is the preferred implementation.
"
Class {
	#name : #XMLHTTPZincResponse,
	#superclass : #XMLHTTPResponse,
	#instVars : [
		'zincResponse'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPZincResponse class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #ZnResponse
]

{ #category : #'instance creation' }
XMLHTTPZincResponse class >> request: aRequest zincResponse: aZincResponse [
	^ (self request: aRequest)
		setZincResponse: aZincResponse
]

{ #category : #defaults }
XMLHTTPZincResponse >> contentReaderClass [
	^ XMLHTTPZincResponseContentReader
]

{ #category : #accessing }
XMLHTTPZincResponse >> headerAt: aKey ifAbsent: aBlock [
	self zincResponse headers
		at: aKey
		ifPresent: [:value |
			^ value isArray
				ifTrue: [value first]
				ifFalse: [value]].
	^ aBlock value.
]

{ #category : #accessing }
XMLHTTPZincResponse >> headerAt: aKey put: aValue [
	self zincResponse headers
		at: aKey
		put: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPZincResponse >> headerKeysAndValuesDo: aTwoArgumentBlock [
	self zincResponse headersDo: aTwoArgumentBlock
]

{ #category : #adding }
XMLHTTPZincResponse >> headerValuesAt: aKey add: aValue [
	self zincResponse headers
		at: aKey
		add: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPZincResponse >> headerValuesAt: aKey do: aBlock [
	self zincResponse headers
		at: aKey
		ifPresent: [:value |
			value isArray
				ifTrue: [value do: aBlock]
				ifFalse: [aBlock value: value]]
]

{ #category : #testing }
XMLHTTPZincResponse >> isSuccess [
	^ self zincResponse isSuccess
]

{ #category : #accessing }
XMLHTTPZincResponse >> protocol [
	^ self zincResponse statusLine version
]

{ #category : #removing }
XMLHTTPZincResponse >> removeHeaderAt: aKey ifAbsent: aBlock [
	| removedValues |

	removedValues :=
		self zincResponse headers
			removeKey: aKey
			ifAbsent: [^ aBlock value].
	^ removedValues isString
		ifTrue: [OrderedCollection with: removedValues]
		ifFalse: [removedValues asOrderedCollection].
]

{ #category : #initialization }
XMLHTTPZincResponse >> setProtocol: aString statusCode: anInteger [
	self zincResponse statusLine:
		((ZnStatusLine code: anInteger)
			version: aString;
			yourself)
]

{ #category : #initialization }
XMLHTTPZincResponse >> setZincResponse: aZincResponse [
	zincResponse := aZincResponse
]

{ #category : #accessing }
XMLHTTPZincResponse >> statusCode [
	^ self zincResponse status
]

{ #category : #accessing }
XMLHTTPZincResponse >> statusLine [
	| statusLine |
	
	statusLine := self zincResponse statusLine.
	^ String streamContents: [:stream |
		stream
			nextPutAll: statusLine version;
			space.
		statusLine printCodeAndReasonOn: stream].
]

{ #category : #private }
XMLHTTPZincResponse >> zincResponse [
	^ zincResponse
		ifNil: [
			zincResponse :=
				(XMLClassFinder classNamed: #ZnResponse) new
					statusLine:
						((ZnStatusLine code: self defaultStatusCode)
							version: self defaultProtocol;
							yourself);
					yourself]
]
