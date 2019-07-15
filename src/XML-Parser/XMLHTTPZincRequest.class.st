"
This class uses Zinc HTTP Components to implement HTTP requests and is the preferred implementation.
"
Class {
	#name : #XMLHTTPZincRequest,
	#superclass : #XMLHTTPRequest,
	#instVars : [
		'zincRequest',
		'zincClient'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #testing }
XMLHTTPZincRequest class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #ZnClient
]

{ #category : #basic }
XMLHTTPZincRequest >> basicCleanup [
	self zincClient close
]

{ #category : #basic }
XMLHTTPZincRequest >> basicSend [
	^ self responseClass
		request: self
		zincResponse:
			(self zincClient
				request: self zincRequest;
				execute;
				response)
]

{ #category : #accessing }
XMLHTTPZincRequest >> headerAt: aKey ifAbsent: aBlock [
	self zincRequest headers
		at: aKey
		ifPresent: [:value |
			^ value isArray
				ifTrue: [value first]
				ifFalse: [value]].
	^ aBlock value.
]

{ #category : #accessing }
XMLHTTPZincRequest >> headerAt: aKey put: aValue [
	self zincRequest headers
		at: aKey
		put: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPZincRequest >> headerKeysAndValuesDo: aTwoArgumentBlock [
	self zincRequest headersDo: aTwoArgumentBlock
]

{ #category : #adding }
XMLHTTPZincRequest >> headerValuesAt: aKey add: aValue [
	self zincRequest headers
		at: aKey
		add: aValue.
	^ aValue.
]

{ #category : #enumerating }
XMLHTTPZincRequest >> headerValuesAt: aKey do: aBlock [
	self zincRequest headers
		at: aKey
		ifPresent: [:value |
			value isArray
				ifTrue: [value do: aBlock]
				ifFalse: [aBlock value: value]]
]

{ #category : #accessing }
XMLHTTPZincRequest >> method [
	^ self zincRequest method asString
]

{ #category : #accessing }
XMLHTTPZincRequest >> method: aString [
	self zincRequest method: aString asSymbol
]

{ #category : #removing }
XMLHTTPZincRequest >> removeHeaderAt: aKey ifAbsent: aBlock [
	| removedValues |

	removedValues :=
		self zincRequest headers
			removeKey: aKey
			ifAbsent: [^ aBlock value].
	^ removedValues isString
		ifTrue: [OrderedCollection with: removedValues]
		ifFalse: [removedValues asOrderedCollection].
]

{ #category : #defaults }
XMLHTTPZincRequest >> responseClass [
	^ XMLHTTPZincResponse
]

{ #category : #accessing }
XMLHTTPZincRequest >> timeout [
	^ self zincClient timeout
]

{ #category : #accessing }
XMLHTTPZincRequest >> timeout: anInteger [
	self zincClient timeout: anInteger
]

{ #category : #'private ' }
XMLHTTPZincRequest >> zincClient [
	^ zincClient
		ifNil: [
			zincClient :=
				(XMLClassFinder classNamed: #ZnClient) new
					streaming: true;
					yourself]
]

{ #category : #'private ' }
XMLHTTPZincRequest >> zincRequest [
	^ zincRequest
		ifNil: [
			zincRequest :=
				(XMLClassFinder classNamed: #ZnRequest)
					get: self url]
]
