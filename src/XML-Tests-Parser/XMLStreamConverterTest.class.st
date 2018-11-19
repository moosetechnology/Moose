"
Abstract, do not run.
"
Class {
	#name : #XMLStreamConverterTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLStreamConverterTest class >> isAbstract [
	^ true
]

{ #category : #testing }
XMLStreamConverterTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLStreamConverterTest >> caseInvertedEncodingNameFrom: anEncodingName [
	| shouldUppercase |

	^ anEncodingName collect: [:each |
		(shouldUppercase ifNil: [shouldUppercase := each isLowercase])
			ifTrue: [
				shouldUppercase := false.
				each asUppercase]
			ifFalse: [
				shouldUppercase := true.
				each asLowercase]]
]

{ #category : #accessing }
XMLStreamConverterTest >> defaultClass [
	^ XMLImplicitUTF8StreamConverter
]

{ #category : #accessing }
XMLStreamConverterTest >> encodingNames [
	^ self streamConverterClass encodingNames
]

{ #category : #accessing }
XMLStreamConverterTest >> encodingNamesWithCaseInversions [
	| encodingNamesWithCaseInversions |

	encodingNamesWithCaseInversions := self encodingNames copy.
	self encodingNames do: [:each |
		"add the case inversion, as well as its inversion"
		encodingNamesWithCaseInversions add:
			(self caseInvertedEncodingNameFrom:
				(encodingNamesWithCaseInversions add:
					(self caseInvertedEncodingNameFrom: each)))].
	^ encodingNamesWithCaseInversions.
]

{ #category : #testing }
XMLStreamConverterTest >> isImplicit [
	^ false
]

{ #category : #'instance creation' }
XMLStreamConverterTest >> newStreamConverter [
	^ self streamConverterClass new
]

{ #category : #accessing }
XMLStreamConverterTest >> nullClass [
	^ XMLNullStreamConverter
]

{ #category : #accessing }
XMLStreamConverterTest >> primaryEncodingName [
	^ ''
]

{ #category : #accessing }
XMLStreamConverterTest >> streamConverterClass [
	^ XMLStreamConverter
]

{ #category : #tests }
XMLStreamConverterTest >> testAbstractClass [
	| streamConverterClass |

	streamConverterClass := self streamConverterClass.
	self assert:
		streamConverterClass abstractClass ==
			(self isImplicit
				ifTrue: [streamConverterClass superclass superclass]
				ifFalse: [streamConverterClass superclass])
]

{ #category : #tests }
XMLStreamConverterTest >> testAsXMLStreamConverter [
	| streamConverter |

	streamConverter := self newStreamConverter.
	self assert: streamConverter asXMLStreamConverter == streamConverter.
]

{ #category : #tests }
XMLStreamConverterTest >> testCanConvertEncoding [
	self encodingNamesWithCaseInversions do: [:each |
		self assert: (self streamConverterClass canConvertEncoding: each)].
	self unconvertableEncodingNames do: [:each |
		self deny: (self streamConverterClass canConvertEncoding: each)].
]

{ #category : #tests }
XMLStreamConverterTest >> testDefault [
	| streamConverter |

	streamConverter := self streamConverterClass default.
	self
		assert: streamConverter class == self defaultClass;
		assert: streamConverter isDefault;
		assert: streamConverter isImplicit.
]

{ #category : #tests }
XMLStreamConverterTest >> testDefaultClass [
	self assert: self streamConverterClass defaultClass == self defaultClass
]

{ #category : #tests }
XMLStreamConverterTest >> testDefaultEncoding [
	self assert:
		self streamConverterClass defaultEncoding =
			self defaultClass primaryEncodingName
]

{ #category : #tests }
XMLStreamConverterTest >> testEncoding [
	self encodingNamesWithCaseInversions do: [:each |
		self assert:
			(XMLStreamConverter newForEncoding: each) encoding =
				self primaryEncodingName]
]

{ #category : #tests }
XMLStreamConverterTest >> testIsAbstractClass [
	| streamConverterClass |

	streamConverterClass := self streamConverterClass.
	self deny: streamConverterClass isAbstractClass.
	self isImplicit
		ifTrue: [streamConverterClass := streamConverterClass superclass].
	[streamConverterClass == XMLStreamConverter]
		whileFalse: [
			streamConverterClass := streamConverterClass superclass.
			self assert: streamConverterClass isAbstractClass].
]

{ #category : #tests }
XMLStreamConverterTest >> testIsDefault [
	self streamConverterClass == self defaultClass
		ifTrue: [self assert: self newStreamConverter isDefault]
		ifFalse: [self deny: self newStreamConverter isDefault]
]

{ #category : #tests }
XMLStreamConverterTest >> testIsDefaultClass [
	self streamConverterClass == self defaultClass
		ifTrue: [self assert: self streamConverterClass isDefaultClass]
		ifFalse: [self deny: self streamConverterClass isDefaultClass]
]

{ #category : #tests }
XMLStreamConverterTest >> testIsImplicit [
	self isImplicit
		ifTrue: [self assert: self newStreamConverter isImplicit]
		ifFalse: [self deny: self newStreamConverter isImplicit]
]

{ #category : #tests }
XMLStreamConverterTest >> testIsNull [
	self streamConverterClass == self nullClass
		ifTrue: [self assert: self newStreamConverter isNull]
		ifFalse: [self deny: self newStreamConverter isNull]
]

{ #category : #tests }
XMLStreamConverterTest >> testNewForEncoding [
	self encodingNamesWithCaseInversions do: [:each |
		(XMLStreamConverter newForEncoding: each) class ==
			self streamConverterClass]
]

{ #category : #tests }
XMLStreamConverterTest >> testNull [
	self assert: self streamConverterClass null class == self nullClass
]

{ #category : #tests }
XMLStreamConverterTest >> testNullClass [
	self assert: self streamConverterClass nullClass == self nullClass
]

{ #category : #tests }
XMLStreamConverterTest >> testPrimaryEncodingName [
	self assert:
		self streamConverterClass primaryEncodingName =
			self primaryEncodingName
]

{ #category : #accessing }
XMLStreamConverterTest >> unconvertableEncodingNames [
	^ #('unconvertableEncodingName')
]
