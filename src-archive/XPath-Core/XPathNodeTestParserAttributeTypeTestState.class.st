"
A state for parsing the arguments of an attribute() type test.
"
Class {
	#name : #XPathNodeTestParserAttributeTypeTestState,
	#superclass : #XPathNodeTestParserAttributeState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserAttributeTypeTestState >> handleEmptyNodeTestWith: aHandler [
	aHandler handleAttributeNodeTest
]
