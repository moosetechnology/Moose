Class {
	#name : #XMLEncodingWriteStreamAdapterTest,
	#superclass : #XMLWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> basicInvalidInputCollections [
	^ #()
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> basicInvalidLatin1InputCollections [
	^ self basicInvalidUTFInputCollections,
		(Array
			with: (String with: 16r000100 asCharacter)
			with: (String with: 16r001000 asCharacter)
			with: (String with: 16r010000 asCharacter)
			with: (String with: 16r100000 asCharacter))
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> basicInvalidUTFInputCollections [
	"code points greater than U+10FFFF aren't tested for because GS Characters
	can only contain values in the range of U+0-10FFFF"
	^ Array
		with: (String with: 16rD800 asCharacter) "first surrogate code point"
		with: (String with: 16rDFFF asCharacter) "last surrogate code point"
]

{ #category : #converting }
XMLEncodingWriteStreamAdapterTest >> contentsFromByteOrderMark [
	^ self asExpectedOutput: self streamConverterClass byteOrderMarkBytes
]

{ #category : #converting }
XMLEncodingWriteStreamAdapterTest >> contentsFromCharacter: aCharacter [
	^ self asExpectedOutput:
		(ByteArray streamContents: [:stream |
			self streamConverterClass new
				nextPut: aCharacter
				toStream: stream])
]

{ #category : #testing }
XMLEncodingWriteStreamAdapterTest >> expectsBinaryOutput [
	^ true
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> invalidInputCollections [
	^ self basicInvalidInputCollections collect: [:each |
		self asExpectedInput: each]
]

{ #category : #'instance creation' }
XMLEncodingWriteStreamAdapterTest >> newStreamAdapterOn: aStream [
	^ (super newStreamAdapterOn: aStream)
		streamConverter: self streamConverterClass new
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> streamAdapterClass [
	^ XMLEncodingWriteStreamAdapter
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> streamCollection [
	^ self expectsBinaryOutput
		ifTrue: [ByteArray new]
		ifFalse: [String new]
]

{ #category : #accessing }
XMLEncodingWriteStreamAdapterTest >> streamConverterClass [
	^ XMLNullStreamConverter
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testHasDefaultStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert:
		adapter hasDefaultStreamConverter = adapter streamConverter isDefault.
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testHasImplicitStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert:
		adapter hasImplicitStreamConverter = adapter streamConverter isImplicit.
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testHasNullStreamConverter [
	| adapter |

	adapter := self newStreamAdapter.
	self assert: adapter hasNullStreamConverter = adapter streamConverter isNull.
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testInvalidCharacters [
	self invalidInputCollections do: [:each | | streamAdapter |
		streamAdapter := self newStreamAdapter.
		self
			should: [streamAdapter nextPutAll: each]
			raise: XMLEncodingException].
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testIsXMLConvertingStreamAdapter [
	self assert: self newStreamAdapter isXMLConvertingStreamAdapter
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testNextPutByteOrderMark [
	| adapter |

	adapter := self newStreamAdapter.
	self
		assert: adapter nextPutByteOrderMark == adapter;
		assert: adapter contents = self contentsFromByteOrderMark.
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testOn [
	| stream adapter |

	stream := self newStream.
	adapter := self newStreamAdapterOn: stream.
	self
		assert: adapter class == self streamAdapterClass;
		assert:
			(self expectsBinaryOutput
				ifTrue: [adapter stream == stream]
				ifFalse: [adapter stream stream == stream]).
]

{ #category : #tests }
XMLEncodingWriteStreamAdapterTest >> testStreamConverter [
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
