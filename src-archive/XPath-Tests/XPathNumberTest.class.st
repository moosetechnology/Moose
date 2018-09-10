Class {
	#name : #XPathNumberTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #tests }
XPathNumberTest >> testAsXPathBoolean [
	self
		assert: 1 asXPathBoolean;
		assert: -1 asXPathBoolean;
		assert: Float infinity asXPathBoolean;
		assert: Float xpathNegativeInfinity asXPathBoolean;
		deny: 0.0 asXPathBoolean;
		deny: Float xpathNegativeZero asXPathBoolean;
		deny: Float nan asXPathBoolean
]

{ #category : #tests }
XPathNumberTest >> testAsXPathComparable [
	| comparable |

	comparable := 1 asXPathComparable.
	self
		assert: comparable class == XPathNumberComparable;
		assert: comparable value = 1.
]

{ #category : #tests }
XPathNumberTest >> testAsXPathNodeSet [
	self
		should: [1.0 asXPathNodeSet]
		raise: XPathTypeException
]

{ #category : #tests }
XPathNumberTest >> testAsXPathNodeSetPosition [
	-10 to: 10 do: [:i | | position |
		position := i asXPathNodeSetPosition.
		self
			assert: position = i;
			assert: position isInteger.

		position := i asFloat asXPathNodeSetPosition.
		self
			assert: position = i;
			assert: position isInteger].

	"Pharo/Squeak (but not GS) OrderedCollections, which XPathNodeSets
	use internally, round float indexes down to the nearest integer, which is
	not OK because the spec doesn't require it (and LibXML2 doesn't do it), so
	fractional, NaN, and infinite positions all have to be converted to an
	always out-of-bounds index"
	-10.5 to: 10.5 do: [:i | | position |
		position := i asXPathNodeSetPosition.
		self
			assert: position isZero;
			assert: position isInteger].
	(Array
		with: Float nan
		with: Float infinity
		with: Float xpathNegativeInfinity
		with: Float xpathNegativeZero)
		do: [:each | | position |
			position := each asXPathNodeSetPosition.
			self
				assert: position isZero;
				assert: position isInteger].
]

{ #category : #tests }
XPathNumberTest >> testAsXPathNumber [
	| number |

	number := 1.0.
	self assert: number asXPathNumber == number.

	"should convert to float"
	number := 1.
	self
		assert: number asXPathNumber = number;
		assert: number asXPathNumber isFloat.
]

{ #category : #tests }
XPathNumberTest >> testAsXPathString [
	self
		assert: 1 asXPathString = '1';
		assert: 1.0 asXPathString = '1';
		assert: Float infinity asXPathString = 'Infinity';
		assert: Float xpathNegativeInfinity asXPathString = '-Infinity';
		assert: Float nan asXPathString = 'NaN';
		assert: 0.0 asXPathString = '0';
		assert: Float xpathNegativeZero asXPathString = '0'
]

{ #category : #tests }
XPathNumberTest >> testIsXPathNegativeZero [
	self
		deny: 0 isXPathNegativeZero;
		deny: 0.0 isXPathNegativeZero;
		assert: Float xpathNegativeZero isXPathNegativeZero
]

{ #category : #tests }
XPathNumberTest >> testIsXPathPositiveZero [
	self
		assert: 0 isXPathPositiveZero;
		assert: 0.0 isXPathPositiveZero;
		deny: Float xpathNegativeZero isXPathPositiveZero
]
