"
A state for parsing node tests where elements are the principal node type.
"
Class {
	#name : #XPathNodeTestParserElementState,
	#superclass : #XPathNodeTestParserState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForLocalName: aLocalName with: aHandler [
	aHandler handleElementNodeTestForLocalName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForName: aName with: aHandler [
	aHandler handleElementNodeTestForName: aName
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForNamespaceURI: aURI localName: aLocalName with: aHandler [
	aHandler
		handleElementNodeTestForNamespaceURI: aURI
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForNamespaceURI: aURI with: aHandler [
	aHandler handleElementNodeTestForNamespaceURI: aURI
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForPrefix: aPrefix localName: aLocalName with: aHandler [
	aHandler
		handleElementNodeTestForPrefix: aPrefix
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleNodeTestForPrefix: aPrefix with: aHandler [
	aHandler handleElementNodeTestForPrefix: aPrefix
]

{ #category : #handling }
XPathNodeTestParserElementState >> handleWildcardNodeTestWith: aHandler [
	aHandler handleElementNodeTest
]
