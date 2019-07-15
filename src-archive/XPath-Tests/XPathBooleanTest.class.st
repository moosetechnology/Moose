Class {
	#name : #XPathBooleanTest,
	#superclass : #TestCase,
	#category : #'XPath-Tests'
}

{ #category : #tests }
XPathBooleanTest >> testAsXPathBoolean [
	self
		assert: true asXPathBoolean;
		deny: false asXPathBoolean
]

{ #category : #tests }
XPathBooleanTest >> testAsXPathComparable [
	| comparable |

	comparable := true asXPathComparable.
	self
		assert: comparable class == XPathBooleanComparable;
		assert: comparable value.
]

{ #category : #tests }
XPathBooleanTest >> testAsXPathNodeSet [
	self
		should: [true asXPathNodeSet]
		raise: XPathTypeException.
	self
		should: [false asXPathNodeSet]
		raise: XPathTypeException.
]

{ #category : #tests }
XPathBooleanTest >> testAsXPathNumber [
	self
		assert: true asXPathNumber = 1.0;
		assert: true asXPathNumber isFloat;
		assert: false asXPathNumber isXPathPositiveZero;
		assert: false asXPathNumber isFloat
]

{ #category : #tests }
XPathBooleanTest >> testAsXPathString [
	self
		assert: true asXPathString = 'true';
		assert: false asXPathString = 'false'
]
