Class {
	#name : #XMLDecodingReadStreamAdapterTest,
	#superclass : #XMLReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> basicInvalidInputCollections [
	^ #()
]

{ #category : #testing }
XMLDecodingReadStreamAdapterTest >> detectsBOMs [
	^ false
]

{ #category : #testing }
XMLDecodingReadStreamAdapterTest >> expectsBinaryInput [
	^ true
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> inputCollection [
	^ self detectsBOMs
		ifTrue: [self inputCollectionByteOrderMark, super inputCollection]
		ifFalse: [super inputCollection]
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> inputCollectionByteOrderMark [
	^ self asExpectedInput: self streamConverterClass byteOrderMarkBytes
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> invalidInputCollections [
	^ self basicInvalidInputCollections collect: [:each |
		self detectsBOMs
			ifTrue: [self inputCollectionByteOrderMark, (self asExpectedInput: each)]
			ifFalse: [self asExpectedInput: each]]
]

{ #category : #'instance creation' }
XMLDecodingReadStreamAdapterTest >> newStreamAdapterOn: aStream [
	| adapter |

	adapter := super newStreamAdapterOn: aStream.
	self detectsBOMs
		ifTrue: [adapter detectEncoding]
		ifFalse: [adapter streamConverter: self streamConverterClass new].
	^ adapter.
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> streamAdapterClass [
	^ XMLDecodingReadStreamAdapter
]

{ #category : #accessing }
XMLDecodingReadStreamAdapterTest >> streamConverterClass [
	^ XMLNullStreamConverter
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testHasDefaultStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert:
		adapter hasDefaultStreamConverter = adapter streamConverter isDefault.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testHasImplicitStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert:
		adapter hasImplicitStreamConverter = adapter streamConverter isImplicit.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testHasNullStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert: adapter hasNullStreamConverter = adapter streamConverter isNull.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testInvalidCharacters [
	self invalidInputCollections do: [:each | | streamAdapter |
		streamAdapter := self newStreamAdapterOn: (self newStreamOn: each).
		[streamAdapter atEnd]
			whileFalse: [
				self
					should: [streamAdapter next]
					raise: XMLEncodingException].
		self assert: streamAdapter atEnd]
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testIsXMLConvertingStreamAdapter [
	self assert: self newStreamAdapter isXMLConvertingStreamAdapter
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testNonDecodingOn [
	| adapter stream |

	stream := self newStream.
	adapter := self streamAdapterClass nonDecodingOn: stream.
	self assert: adapter hasNullStreamConverter.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testNonDecodingOnIfBinaryOrExternal [
	| basicInputCollection adapter stream |

	basicInputCollection := self basicInputCollection.
	stream := self newStreamOn: (self binaryFrom: basicInputCollection).
	adapter := self streamAdapterClass nonDecodingOnIfBinaryOrExternal: stream.
	self
		assert: adapter class == self streamAdapterClass;
		assert: adapter hasNullStreamConverter.

	stream := self newStreamOn: (self stringFrom: basicInputCollection).
	adapter := self streamAdapterClass nonDecodingOnIfBinaryOrExternal: stream.
	self assert: adapter isNil.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testOn [
	| adapter stream |

	super testOn.

	stream := self newStream.
	adapter := self streamAdapterClass on: stream.
	self assert: adapter hasDefaultStreamConverter.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testOnIfBinaryOrExternal [
	| adapter stream |

	super testOnIfBinaryOrExternal.

	stream := self newStreamOn: (self binaryFrom: self basicInputCollection).
	adapter := self streamAdapterClass onIfBinaryOrExternal: stream.
	self
		assert: adapter class == self streamAdapterClass;
		assert: adapter hasDefaultStreamConverter.
]

{ #category : #tests }
XMLDecodingReadStreamAdapterTest >> testStreamConverter [
	| adapter newConverter |

	adapter := self newStreamAdapter.
	self
		deny: adapter streamConverter isNil;
		assert: adapter streamConverter class == self streamConverterClass.

	newConverter := self streamConverterClass new.
	self
		assert: (adapter streamConverter: newConverter) == adapter;
		assert: adapter streamConverter == newConverter.

	self
		assert: (adapter streamConverter: nil) == adapter;
		assert: adapter streamConverter class == XMLNullStreamConverter.
]
