"
A state for parsing node tests where namespaces are the principal node type.
"
Class {
	#name : #XPathNodeTestParserNamespaceState,
	#superclass : #XPathNodeTestParserState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForLocalName: aLocalName with: aHandler [
	aHandler handleNamespaceNodeTestForLocalName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForName: aName with: aHandler [
	aHandler handleNamespaceNodeTestForName: aName
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForNamespaceURI: aURI localName: aLocalName with: aHandler [
	aHandler
		handleNamespaceNodeTestForNamespaceURI: aURI
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForNamespaceURI: aURI with: aHandler [
	aHandler handleNamespaceNodeTestForNamespaceURI: aURI
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForPrefix: aPrefix localName: aLocalName with: aHandler [
	aHandler
		handleNamespaceNodeTestForPrefix: aPrefix
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleNodeTestForPrefix: aPrefix with: aHandler [
	aHandler handleNamespaceNodeTestForPrefix: aPrefix
]

{ #category : #handling }
XPathNodeTestParserNamespaceState >> handleWildcardNodeTestWith: aHandler [
	aHandler handleNamespaceNodeTest
]
