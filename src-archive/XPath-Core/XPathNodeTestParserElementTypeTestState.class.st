"
A state for parsing the arguments of an element() type test.
"
Class {
	#name : #XPathNodeTestParserElementTypeTestState,
	#superclass : #XPathNodeTestParserElementState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserElementTypeTestState >> handleEmptyNodeTestWith: aHandler [
	aHandler handleElementNodeTest
]
