"
This class uses the WebClient library to implement HTTP responses. This is used on Squeak when Zinc isn't installed.
"
Class {
	#name : #XMLHTTPWebClientResponse,
	#superclass : #XMLHTTPResponse,
	#instVars : [
		'webClientResponse'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPWebClientResponse class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #WebResponse
]

{ #category : #'instance creation' }
XMLHTTPWebClientResponse class >> request: aRequest webClientResponse: aWebClientResponse [
	^ (self request: aRequest)
		setWebClientResponse: aWebClientResponse
]

{ #category : #defaults }
XMLHTTPWebClientResponse >> contentReaderClass [
	^ XMLHTTPWebClientResponseContentReader
]

{ #category : #accessing }
XMLHTTPWebClientResponse >> headerAt: aKey ifAbsent: aBlock [
	^ self webClientResponse
		headerAt: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLHTTPWebClientResponse >> headerAt: aKey put: aValue [
	self webClientResponse
		removeHeader: aKey;
		addHeader: aKey value: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPWebClientResponse >> headerKeysAndValuesDo: aTwoArgumentBlock [
	self webClientResponse headersDo: aTwoArgumentBlock
]

{ #category : #adding }
XMLHTTPWebClientResponse >> headerValuesAt: aKey add: aValue [
	self webClientResponse
		addHeader: aKey
		value: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPWebClientResponse >> headerValuesAt: aKey do: aBlock [
	self webClientResponse
		headersAt: aKey
		do: aBlock
]

{ #category : #testing }
XMLHTTPWebClientResponse >> isSuccess [
	^ self webClientResponse isSuccess
]

{ #category : #accessing }
XMLHTTPWebClientResponse >> protocol [
	^ self webClientResponse protocol
]

{ #category : #removing }
XMLHTTPWebClientResponse >> removeHeaderAt: aKey ifAbsent: aBlock [
	| removedValues |

	removedValues :=
		self webClientResponse
			headersAt: aKey
			ifAbsent: [^ aBlock value].
	self webClientResponse removeHeader: aKey.
	^ removedValues asOrderedCollection.
]

{ #category : #initialization }
XMLHTTPWebClientResponse >> setProtocol: aString statusCode: anInteger [
	self webClientResponse
		protocol: aString
		code: anInteger
]

{ #category : #initialization }
XMLHTTPWebClientResponse >> setWebClientResponse: aWebClientResponse [
	webClientResponse := aWebClientResponse
]

{ #category : #accessing }
XMLHTTPWebClientResponse >> statusCode [
	^ self webClientResponse code
]

{ #category : #accessing }
XMLHTTPWebClientResponse >> statusLine [
	^ self webClientResponse status
]

{ #category : #private }
XMLHTTPWebClientResponse >> webClientResponse [
	^ webClientResponse
		ifNil: [
			webClientResponse :=
				(XMLClassFinder classNamed: #WebResponse)
					protocol: self defaultProtocol
					code: self defaultStatusCode]
]
