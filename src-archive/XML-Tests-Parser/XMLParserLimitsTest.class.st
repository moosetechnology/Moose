Class {
	#name : #XMLParserLimitsTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #source }
XMLParserLimitsTest >> recursiveEntitiesNamed: aName depth: aLimit isParameter: aBoolean [
	| xml |

	xml := String new writeStream.
	1 to: aLimit do: [:i |
		xml
			cr;
			nextPutAll: '<!ENTITY '.
		aBoolean
			ifTrue: [xml nextPutAll: '% '].
		xml
			nextPutAll: aName, i printString;
			nextPutAll: ' "'.
			(i = aLimit)
				ifTrue: [xml nextPutAll: '<!--last-->']
				ifFalse: [
					aBoolean
						ifTrue: [xml nextPutAll: '&#37;']
						ifFalse: [xml nextPut: $&].
					xml
						nextPutAll: aName, (i + 1) printString;
						nextPut: $;].
		xml nextPutAll: '">'].
	^ xml contents.
]

{ #category : #tests }
XMLParserLimitsTest >> testDocumentReadLimit [
	| xml replacement |

	replacement := 'entity replacement'.
	xml := '<!DOCTYPE test [<!ENTITY entity "', replacement, '">]><test>&entity;</test>'.
	self
		shouldnt: [
			(SAXHandler on: xml)
				documentReadLimit: xml size + replacement size;
				parseDocument]
		raise: XMLLimitException.
	self
		should: [
			(SAXHandler on: xml)
				documentReadLimit: xml size + replacement size - 1;
				parseDocument]
		raise: XMLLimitException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				documentReadLimit: nil;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testRecursiveGeneralEntityReplacement [
	| limit xml |

	limit := 3.
	xml :=
		self
			xmlWithRecursiveEntitiesNamed: 'entity'
			depth: limit
			isParameter: false.
	self
		shouldnt: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: limit;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testRecursiveGeneralEntityReplacementPastLimit [
	| limit xml |

	limit := 3.
	xml :=
		self
			xmlWithRecursiveEntitiesNamed: 'entity'
			depth: limit + 1
			isParameter: false.
	self
		should: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: limit;
				parseDocument]
		raise: XMLLimitException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: nil;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testRecursiveParameterEntityReplacement [
	| limit xml |

	limit := 3.
	xml :=
		self
			xmlWithRecursiveEntitiesNamed: 'entity'
			depth: limit
			isParameter: true.
	self
		shouldnt: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: limit;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testRecursiveParameterEntityReplacementPastLimit [
	| limit xml |

	limit := 3.
	xml :=
		self
			xmlWithRecursiveEntitiesNamed: 'entity'
			depth: limit + 1
			isParameter: true.
	self
		should: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: limit;
				parseDocument]
		raise: XMLLimitException.
	self
		shouldnt: [
			(SAXHandler on: xml)
				maxEntityReplacementDepth: nil;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testResolvingLocalFromNonLocal [
	| parser |

	self
		should: [
			(parser :=
				SAXHandler
					on: '<!DOCTYPE root SYSTEM "file://local/uri">'
					documentURI: 'http://www.example.com')
				externalEntityResolver resolvesLocalFromNonLocal: false.
			parser
				resolvesExternalEntities: true;
				parseDocument]
		raise: XMLLimitException.
]

{ #category : #tests }
XMLParserLimitsTest >> testStreamReaderMaxPushBack [
	| streamReader |

	streamReader := XMLNestedStreamReader on: '' readStream.
	self
		shouldnt: [
			streamReader maxNestedStreams
				timesRepeat: [streamReader pushBack: 'test']]
		raise: XMLLimitException.
	self
		should: [streamReader pushBack: 'test']
		raise: XMLLimitException.
]

{ #category : #source }
XMLParserLimitsTest >> xmlWithRecursiveEntitiesNamed: aName depth: aLimit isParameter: aBoolean [
	| xml |

	(xml := String new writeStream)
		nextPutAll: '<!DOCTYPE test ['.
	xml nextPutAll:
		(self
			recursiveEntitiesNamed: aName
			depth: aLimit
			isParameter: aBoolean).
	aBoolean
		ifTrue: [xml nextPutAll: '%', aName, '1;]><test/>']
		ifFalse: [xml nextPutAll: ']><test>&', aName, '1;</test>'].

	^ xml contents.
]
