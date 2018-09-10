"
A state for parsing the arguments of a namespace() type test.
"
Class {
	#name : #XPathNodeTestParserNamespaceTypeTestState,
	#superclass : #XPathNodeTestParserNamespaceState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserNamespaceTypeTestState >> handleEmptyNodeTestWith: aHandler [
	aHandler handleNamespaceNodeTest
]
