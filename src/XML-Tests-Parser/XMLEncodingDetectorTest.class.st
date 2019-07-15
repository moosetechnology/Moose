"
Abstract, do not run.
"
Class {
	#name : #XMLEncodingDetectorTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLEncodingDetectorTest class >> isAbstract [
	^ true
]

{ #category : #testing }
XMLEncodingDetectorTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #converting }
XMLEncodingDetectorTest >> asExpectedInput: anInputCollections [
	^ self detectsBinaryInput
		ifTrue: [XMLStreamAdapterTest binaryFrom: anInputCollections]
		ifFalse: [XMLStreamAdapterTest stringFrom: anInputCollections]
]

{ #category : #accessing }
XMLEncodingDetectorTest >> basicImplicitEncodedInputCollections [
	^ #()
]

{ #category : #accessing }
XMLEncodingDetectorTest >> basicInvalidImplicitEncodedInputCollections [
	^ #()
]

{ #category : #testing }
XMLEncodingDetectorTest >> detectsBinaryInput [
	^ true
]

{ #category : #accessing }
XMLEncodingDetectorTest >> encodingDetectorClass [
	^ XMLEncodingDetector
]

{ #category : #accessing }
XMLEncodingDetectorTest >> explicitEncodedInputCollections [
	^ self implicitEncodedInputCollections collect: [:each |
		self inputCollectionByteOrderMark, each]
]

{ #category : #accessing }
XMLEncodingDetectorTest >> explicitEncodingDetectorClass [
	^ XMLEncodingDetector
]

{ #category : #accessing }
XMLEncodingDetectorTest >> explicitStreamConverterClass [
	^ XMLStreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorTest >> implicitEncodedInputCollections [
	^ self basicImplicitEncodedInputCollections collect: [:each |
		self asExpectedInput: each]
]

{ #category : #accessing }
XMLEncodingDetectorTest >> implicitEncodingDetectorClass [
	^ XMLImplicitEncodingDetector
]

{ #category : #accessing }
XMLEncodingDetectorTest >> implicitStreamConverterClass [
	^ XMLStreamConverter
]

{ #category : #accessing }
XMLEncodingDetectorTest >> inputCollectionByteOrderMark [
	^ self asExpectedInput: self explicitStreamConverterClass byteOrderMarkBytes
]

{ #category : #accessing }
XMLEncodingDetectorTest >> invalidImplicitEncodedInputCollections [
	^ self basicInvalidImplicitEncodedInputCollections collect: [:each |
		self asExpectedInput: each]
]

{ #category : #'instance creation' }
XMLEncodingDetectorTest >> newExplicitEncodingDetectorOn: aStream [
	^ self explicitEncodingDetectorClass on: aStream
]

{ #category : #'instance creation' }
XMLEncodingDetectorTest >> newImplicitEncodingDetectorOn: aStream [
	^ self implicitEncodingDetectorClass on: aStream
]

{ #category : #'instance creation' }
XMLEncodingDetectorTest >> newStreamOn: aString [
	^ aString readStream
]

{ #category : #tests }
XMLEncodingDetectorTest >> testStreamConverterForEncoding [
	self explicitEncodedInputCollections do: [:each |
		| stream startPosition streamConverter |
	
		stream := self newStreamOn: each.
		startPosition := stream position.
		streamConverter :=
			(self newExplicitEncodingDetectorOn: stream)
				streamConverterForEncoding.
		self
			deny: streamConverter isNil;
		 	assert: streamConverter class == self explicitStreamConverterClass;
			deny: streamConverter isImplicit;
			assert:
				stream position =
					(startPosition + self inputCollectionByteOrderMark size)].

	self implicitEncodedInputCollections do: [:each |
		| stream startPosition streamConverter |
	
		stream := self newStreamOn: each.
		startPosition := stream position.
		streamConverter :=
			(self newExplicitEncodingDetectorOn: stream)
				streamConverterForEncoding.
		self
			assert: streamConverter isNil;
			assert: stream position = startPosition.

		stream := self newStreamOn: each.
		startPosition := stream position.
		streamConverter :=
			(self newImplicitEncodingDetectorOn: stream)
				streamConverterForEncoding.
		self
			deny: streamConverter isNil;
		 	assert: streamConverter class == self implicitStreamConverterClass;
			assert: streamConverter isImplicit;
			assert: stream position = startPosition].

	self invalidImplicitEncodedInputCollections do: [:each |
		| stream startPosition streamConverter |

		stream := self newStreamOn: each.
		startPosition := stream position.
		streamConverter :=
			(self newImplicitEncodingDetectorOn: stream)
				streamConverterForEncoding.
		self
			assert: streamConverter isNil;
			assert: stream position = startPosition].
]
