"
This class uses the WebClient library to implement HTTP requests. This is used on Squeak when Zinc isn't installed.
"
Class {
	#name : #XMLHTTPWebClientRequest,
	#superclass : #XMLHTTPRequest,
	#instVars : [
		'webClientClient',
		'webClientRequest'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPWebClientRequest class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #WebClient
]

{ #category : #basic }
XMLHTTPWebClientRequest >> basicCleanup [
	self webClientClient close
]

{ #category : #basic }
XMLHTTPWebClientRequest >> basicSend [
	^ self responseClass
		request: self
		webClientResponse:
			(self webClientClient
				"#sendRequest: unfortunately requires #initializeFromUrl:
				to be sent first"
				initializeFromUrl: self url;
				sendRequest: self webClientRequest)
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> headerAt: aKey ifAbsent: aBlock [
	^ self webClientRequest
		headerAt: aKey
		ifAbsent: aBlock
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> headerAt: aKey put: aValue [
	self webClientRequest
		removeHeader: aKey;
		addHeader: aKey value: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPWebClientRequest >> headerKeysAndValuesDo: aTwoArgumentBlock [
	self webClientRequest headersDo: aTwoArgumentBlock
]

{ #category : #adding }
XMLHTTPWebClientRequest >> headerValuesAt: aKey add: aValue [
	self webClientRequest
		addHeader: aKey
		value: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPWebClientRequest >> headerValuesAt: aKey do: aBlock [
	self webClientRequest
		headersAt: aKey
		do: aBlock
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> method [
	^ self webClientRequest method
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> method: aString [
	self webClientRequest method: aString
]

{ #category : #removing }
XMLHTTPWebClientRequest >> removeHeaderAt: aKey ifAbsent: aBlock [
	| removedValues |

	removedValues :=
		self webClientRequest
			headersAt: aKey
			ifAbsent: [^ aBlock value].
	self webClientRequest removeHeader: aKey.
	^ removedValues asOrderedCollection.
]

{ #category : #defaults }
XMLHTTPWebClientRequest >> responseClass [
	^ XMLHTTPWebClientResponse
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> timeout [
	^ self webClientClient timeout
]

{ #category : #accessing }
XMLHTTPWebClientRequest >> timeout: anInteger [
	self webClientClient timeout: anInteger
]

{ #category : #private }
XMLHTTPWebClientRequest >> webClientClient [
	^ webClientClient
		ifNil: [
			webClientClient := (XMLClassFinder classNamed: #WebClient) new]
]

{ #category : #private }
XMLHTTPWebClientRequest >> webClientRequest [
	^ webClientRequest
		ifNil: [
			webClientRequest :=
				(XMLClassFinder classNamed: #WebRequest) new
					initializeFromUrl: self url;
					yourself]
]
