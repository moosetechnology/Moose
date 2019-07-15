Class {
	#name : #XPathStringTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #tests }
XPathStringTest >> testAsXPathBoolean [
	self
		assert: 'true' asXPathBoolean;
		assert: 'false' asXPathBoolean;
		assert: '0' asXPathBoolean;
		deny: '' asXPathBoolean
]

{ #category : #tests }
XPathStringTest >> testAsXPathComparable [
	| comparable |

	comparable := 'test' asXPathComparable.
	self
		assert: comparable class == XPathStringComparable;
		assert: comparable value = 'test'.
]

{ #category : #tests }
XPathStringTest >> testAsXPathNodeSet [
	self
		should: ['test' asXPathNodeSet]
		raise: XPathTypeException
]

{ #category : #tests }
XPathStringTest >> testAsXPathNumber [
	self
		assert: '1.5' asXPathNumber = 1.5;
		assert: ' -1.5 ' asXPathNumber = -1.5;
		assert: '21.25' asXPathNumber = 21.25;
		assert: ' -21.25 ' asXPathNumber = -21.25;
		assert: '321.325' asXPathNumber = 321.325;
		assert: ' -321.325 ' asXPathNumber = -321.325;
		assert: ' 	0.0 ' asXPathNumber isXPathPositiveZero;
		assert: '  -0.0   ' asXPathNumber isXPathNegativeZero;
		assert: '  .1  ' asXPathNumber = 0.1;
		assert: '  1. ' asXPathNumber = 1;
		assert: '  -.1  ' asXPathNumber = -0.1;
		assert: '  -1. ' asXPathNumber = -1;
		assert: '  .  ' asXPathNumber isNaN;
		assert: '   ' asXPathNumber isNaN.
]

{ #category : #tests }
XPathStringTest >> testAsXPathString [
	| string |

	string := 'test'.
	self assert: string asXPathString == string.
]
