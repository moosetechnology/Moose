"
This is an abstract class for HTTP messages.
"
Class {
	#name : #XMLHTTPMessage,
	#superclass : #XMLAbstractFactory,
	#instVars : [
		'content'
	],
	#category : #'XML-Parser-HTTP'
}

{ #category : #adding }
XMLHTTPMessage >> addHeader: anAssociation [
	self
		headerValuesAt: anAssociation key
		add: anAssociation value.
	^ anAssociation.
]

{ #category : #accessing }
XMLHTTPMessage >> content [
	"Returns the response content as a String or ByteArray"

	"Requests with content aren't supported yet"
	^ content ifNil: [content := '']
]

{ #category : #accessing }
XMLHTTPMessage >> content: aStringOrByteArray [
	content := aStringOrByteArray
]

{ #category : #accessing }
XMLHTTPMessage >> contentCharset [
	| contentType charset |

	^ ((contentType := self contentType) isNil
		or: [(charset := contentType charset) isEmpty])
		ifTrue: [self defaultContentCharset]
		ifFalse: [charset]
]

{ #category : #accessing }
XMLHTTPMessage >> contentEncoding [
	"Returns the non-identity content encoding compression schemes
	in the order they were applied"

	^ self encodingNamesFromHeaderValuesAt: 'Content-Encoding'
]

{ #category : #accessing }
XMLHTTPMessage >> contentEncoding: aStringOrCollection [
	self
		encodingNamesFromHeaderValuesAt: 'Content-Encoding'
		put: aStringOrCollection
]

{ #category : #accessing }
XMLHTTPMessage >> contentLength [
	^ XMLIntegerReader
		readFrom:
			(self
				headerAt: 'Content-Length'
				ifAbsent: [^ nil]) readStream
		withBase: 10
]

{ #category : #accessing }
XMLHTTPMessage >> contentLength: anInteger [
	anInteger
		ifNil: [
			self
				removeHeaderAt: 'Content-Length'
				ifAbsent: []]
		ifNotNil: [
			self
				headerAt: 'Content-Length'
				put: anInteger asString]
]

{ #category : #accessing }
XMLHTTPMessage >> contentType [
	"Returns an XMLMIMEType object for the Content-Type header value"

	^ XMLHTTPMIMEType fromString:
		(self
			headerAt: 'Content-Type'
			ifAbsent: [^ nil])
]

{ #category : #accessing }
XMLHTTPMessage >> contentType: aMIMETypeOrString [
	aMIMETypeOrString
		ifNil: [
			self
				removeHeaderAt: 'Content-Type'
				ifAbsent: []]
		ifNotNil: [
			self
				headerAt: 'Content-Type'
				put: aMIMETypeOrString asString]
]

{ #category : #defaults }
XMLHTTPMessage >> defaultContentCharset [
	^ XMLHTTPMIMEType defaultCharset
]

{ #category : #private }
XMLHTTPMessage >> encodingNamesFromHeaderValuesAt: aKey [
	"Returns the non-identity encoding compression schemes
	in the order they were applied from the value(s) of the
	specified header"

	| encodingNames |

	encodingNames := OrderedCollection new.
	self
		headerValuesAt: aKey
		do: [:headerValue |
			$,
				xmlSplit: headerValue
				do: [:headerValueField | | encodingName |
					encodingName :=
						headerValueField xmlCopyWithoutWhitespace asLowercase.
					(encodingName isEmpty
						or: [encodingName = 'identity'])
						ifFalse: [encodingNames addLast: encodingName]]].
	^ encodingNames.
]

{ #category : #private }
XMLHTTPMessage >> encodingNamesFromHeaderValuesAt: aKey put: aStringOrCollection [
	aStringOrCollection isEmpty
		ifTrue: [
			self
				removeHeaderAt: aKey
				ifAbsent: []]
		ifFalse: [
			self
				headerAt: aKey
				put:
					(aStringOrCollection isString
						ifTrue: [aStringOrCollection]
						ifFalse: [
							String streamContents: [:stream |
								aStringOrCollection
									do: [:each | stream nextPutAll: each]
									separatedBy: [stream nextPutAll: ', ']]])]
]

{ #category : #private }
XMLHTTPMessage >> errorRemovingAbsentHeader: aKey [
	XMLHTTPException
		formatSignal: 'Cannot remove absent HTTP header "{1}" from message'
		with: aKey
]

{ #category : #testing }
XMLHTTPMessage >> hasContent [
	^ self content notEmpty
]

{ #category : #testing }
XMLHTTPMessage >> hasHeaders [
	self headerKeysDo: [:key | ^ true].
	^ false.
]

{ #category : #accessing }
XMLHTTPMessage >> headerAt: aKey [
	^ self
		headerAt: aKey
		ifAbsent: ['']
]

{ #category : #accessing }
XMLHTTPMessage >> headerAt: aKey ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPMessage >> headerAt: aKey ifAbsentPut: aBlock [
	^ self
		headerAt: aKey
		ifAbsent: [
			self
				headerAt: aKey
				put: aBlock value]
]

{ #category : #accessing }
XMLHTTPMessage >> headerAt: aKey put: aValue [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPMessage >> headerKeys [
	| keys |

	keys := OrderedCollection new.
	self headerKeysDo: [:key |
		keys addLast: key].
	^ keys.
]

{ #category : #enumerating }
XMLHTTPMessage >> headerKeysAndValuesDo: aTwoArgumentBlock [
	self subclassResponsibility
]

{ #category : #enumerating }
XMLHTTPMessage >> headerKeysDo: aBlock [
	self headerKeysAndValuesDo: [:key :value |
		aBlock value: key]
]

{ #category : #accessing }
XMLHTTPMessage >> headerValuesAt: aKey [
	| values |

	values := OrderedCollection new.
	self
		headerValuesAt: aKey
		do: [:each | values addLast: each].
	^ values.
]

{ #category : #adding }
XMLHTTPMessage >> headerValuesAt: aKey add: aValue [
	self subclassResponsibility
]

{ #category : #enumerating }
XMLHTTPMessage >> headerValuesAt: aKey do: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
XMLHTTPMessage >> headers [
	| headers |

	headers := OrderedCollection new.
	self headerKeysAndValuesDo: [:key :value |
		headers addLast: key -> value].
	^ headers.
]

{ #category : #testing }
XMLHTTPMessage >> includesHeaderAt: aKey [
	self
		headerAt: aKey
		ifAbsent: [^ false].
	^ true.
]

{ #category : #removing }
XMLHTTPMessage >> removeHeaderAt: aKey [
	^ self
		removeHeaderAt: aKey
		ifAbsent: [self errorRemovingAbsentHeader: aKey]
]

{ #category : #removing }
XMLHTTPMessage >> removeHeaderAt: aKey ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #removing }
XMLHTTPMessage >> removeHeaders [
	self headerKeys do: [:each |
		self
			removeHeaderAt: each
			ifAbsent: []]
]
