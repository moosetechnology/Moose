"
Abstract, do not run.
"
Class {
	#name : #XMLStreamAdapterTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #converting }
XMLStreamAdapterTest class >> binaryFrom: aCollection [
	aCollection class == ByteArray
		ifTrue: [^ aCollection]
		ifFalse: [
			^ ByteArray streamContents: [:stream |
				aCollection do: [:each |
					stream nextPut: each asInteger]]]
]

{ #category : #accessing }
XMLStreamAdapterTest class >> decodedASCIIString [
	^ self stringFrom: self encodedASCIIBinary
]

{ #category : #accessing }
XMLStreamAdapterTest class >> decodedLatin1String [
	^ self stringFrom: self encodedLatin1Binary
]

{ #category : #accessing }
XMLStreamAdapterTest class >> decodedUTF16String [
	^ self stringFrom:
		#(16rFF 16r0100 16rD7FF 16rE000 16rFFFF 16r10000 16r10437 16r24B62 16r10FFFF)
]

{ #category : #accessing }
XMLStreamAdapterTest class >> decodedUTF32String [
	^ self stringFrom: #(16rFE 16rD7FE 16r10FFFF)
]

{ #category : #accessing }
XMLStreamAdapterTest class >> decodedUTF8String [
	^ self stringFrom:
		#(16r01 16r0F 16r7F 16r80 16r7FF 16r800 16rFEFE 16rFFFF 16r10000 16r10FFFF)
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedASCIIBinary [
	^ (16r01 to: 16r7F) asByteArray
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedLatin1Binary [
	^ (16r01 to: 16rFF) asByteArray
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedUTF16BEBinary [
	^ #[16r00 16rFF
		16r01 16r00
		16rD7 16rFF
		16rE0 16r00
		16rFF 16rFF
		16rD8 16r00 16rDC 16r00 "first surrogate pair"
		16rD8 16r01 16rDC 16r37
		16rD8 16r52 16rDF 16r62
		16rDB 16rFF 16rDF 16rFF] "last surrogate pair"
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedUTF16LEBinary [
	^ #[16rFF 16r00
		16r00 16r01
		16rFF 16rD7
		16r00 16rE0
		16rFF 16rFF
		16r00 16rD8 16r00 16rDC "first surrogate pair"
		16r01 16rD8 16r37 16rDC
		16r52 16rD8 16r62 16rDF
		16rFF 16rDB 16rFF 16rDF] "last surrogate pair"
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedUTF32BEBinary [
	^ #[16r00 16r00 16r00 16rFE
		16r00 16r00 16rD7 16rFE
		16r00 16r10 16rFF 16rFF]
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedUTF32LEBinary [
	^ #[16rFE 16r00 16r00 16r00
		16rFE 16rD7 16r00 16r00
		16rFF 16rFF 16r10 16r00]
]

{ #category : #accessing }
XMLStreamAdapterTest class >> encodedUTF8Binary [
	^ #[16r01
		16r0F
		16r7F
		16rC2 16r80
		16rDF 16rBF
		16rE0 16rA0 16r80
		16rEF 16rBB 16rBE
		16rEF 16rBF 16rBF
		16rF0 16r90 16r80 16r80
		16rF4 16r8F 16rBF 16rBF]
]

{ #category : #testing }
XMLStreamAdapterTest class >> isAbstract [
	^ true
]

{ #category : #converting }
XMLStreamAdapterTest class >> percentEncodeCharacter: aCharacter [
	| hexString |

	(hexString := aCharacter asInteger printStringHex asUppercase) size > 1
		ifTrue: [^ '%', hexString]
		ifFalse: [^ '%0', hexString]
]

{ #category : #converting }
XMLStreamAdapterTest class >> percentEncodeCharacters: aCharacterCollection [
	^ String streamContents: [:stream |
		aCharacterCollection do: [:each |
			stream nextPutAll:
				(self percentEncodeCharacter: each)]]
]

{ #category : #testing }
XMLStreamAdapterTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #converting }
XMLStreamAdapterTest class >> stringFrom: aCollection [
	aCollection isString
		ifTrue: [^ aCollection]
		ifFalse: [
			"avoid #asString for GS portability"
			^ String streamContents: [:stream |
				aCollection do: [:each |
					stream nextPut: each asCharacter]]]
]

{ #category : #converting }
XMLStreamAdapterTest >> asExpectedInput: aCollection [
	^ self expectsBinaryInput
		ifTrue: [self binaryFrom: aCollection]
		ifFalse: [self stringFrom: aCollection]
]

{ #category : #converting }
XMLStreamAdapterTest >> asExpectedOutput: aCollection [
	^ self expectsBinaryOutput
		ifTrue: [self binaryFrom: aCollection]
		ifFalse: [self stringFrom: aCollection]
]

{ #category : #accessing }
XMLStreamAdapterTest >> basicInputCollection [
	^ 'test'
]

{ #category : #accessing }
XMLStreamAdapterTest >> basicOutputCollection [
	^ self basicInputCollection
]

{ #category : #converting }
XMLStreamAdapterTest >> binaryFrom: aCollection [
	^ self class binaryFrom: aCollection
]

{ #category : #accessing }
XMLStreamAdapterTest >> decodedASCIIString [
	^ self class decodedASCIIString
]

{ #category : #accessing }
XMLStreamAdapterTest >> decodedLatin1String [
	^ self class decodedLatin1String
]

{ #category : #accessing }
XMLStreamAdapterTest >> decodedUTF16String [
	^ self class decodedUTF16String
]

{ #category : #accessing }
XMLStreamAdapterTest >> decodedUTF32String [
	^ self class decodedUTF32String
]

{ #category : #accessing }
XMLStreamAdapterTest >> decodedUTF8String [
	^ self class decodedUTF8String
]

{ #category : #accessing }
XMLStreamAdapterTest >> emptyOutputCollection [
	^ self outputCollection copyEmpty
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedASCIIBinary [
	^ self class encodedASCIIBinary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedLatin1Binary [
	^ self class encodedLatin1Binary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedUTF16BEBinary [
	^ self class encodedUTF16BEBinary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedUTF16LEBinary [
	^ self class encodedUTF16LEBinary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedUTF32BEBinary [
	^ self class encodedUTF32BEBinary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedUTF32LEBinary [
	^ self class encodedUTF32LEBinary
]

{ #category : #accessing }
XMLStreamAdapterTest >> encodedUTF8Binary [
	^ self class encodedUTF8Binary
]

{ #category : #testing }
XMLStreamAdapterTest >> expectsBinaryInput [
	^ false
]

{ #category : #testing }
XMLStreamAdapterTest >> expectsBinaryOutput [
	^ false
]

{ #category : #accessing }
XMLStreamAdapterTest >> inputCollection [
	^ self asExpectedInput: self basicInputCollection
]

{ #category : #testing }
XMLStreamAdapterTest >> isBinary [
	^ false
]

{ #category : #'instance creation' }
XMLStreamAdapterTest >> newStream [
	^ self newStreamOn: self streamCollection
]

{ #category : #'instance creation' }
XMLStreamAdapterTest >> newStreamAdapter [
	^ self newStreamAdapterOn: self newStream
]

{ #category : #'instance creation' }
XMLStreamAdapterTest >> newStreamAdapterOn: aStream [
	^ self streamAdapterClass on: aStream
]

{ #category : #'instance creation' }
XMLStreamAdapterTest >> newStreamOn: aCollection [
	^ self streamClass on: aCollection
]

{ #category : #accessing }
XMLStreamAdapterTest >> outputCollection [
	^ self asExpectedOutput: self basicOutputCollection
]

{ #category : #accessing }
XMLStreamAdapterTest >> streamAdapterClass [
	^ XMLStreamAdapter
]

{ #category : #accessing }
XMLStreamAdapterTest >> streamClass [
	^ ReadStream
]

{ #category : #accessing }
XMLStreamAdapterTest >> streamCollection [
	^ String new
]

{ #category : #converting }
XMLStreamAdapterTest >> stringFrom: aCollection [
	^ self class stringFrom: aCollection
]

{ #category : #tests }
XMLStreamAdapterTest >> testClose [
	self
		shouldnt: [self newStreamAdapter close]
		raise: Error
]

{ #category : #tests }
XMLStreamAdapterTest >> testIsBinary [
	self assert: self newStreamAdapter isBinary = self isBinary
]

{ #category : #tests }
XMLStreamAdapterTest >> testIsStream [
	self assert: self newStreamAdapter isStream
]

{ #category : #tests }
XMLStreamAdapterTest >> testIsXMLBinaryOrExternalStream [
	| streamAdapter |

	streamAdapter := self newStreamAdapter.
	self assert: streamAdapter isXMLBinaryOrExternalStream = streamAdapter isBinary.
]

{ #category : #tests }
XMLStreamAdapterTest >> testIsXMLConvertingStreamAdapter [
	self deny: self newStreamAdapter isXMLConvertingStreamAdapter
]

{ #category : #tests }
XMLStreamAdapterTest >> testNew [
	self
		should: [self streamClass new]
		raise: Error
]

{ #category : #tests }
XMLStreamAdapterTest >> testOn [
	| stream adapter |

	stream := self newStream.
	adapter := self newStreamAdapterOn: stream.
	self
		assert: adapter class == self streamAdapterClass;
		assert: adapter stream == stream.
]
