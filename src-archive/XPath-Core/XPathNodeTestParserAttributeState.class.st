"
A state for parsing node tests where attributes are the principal node type.
"
Class {
	#name : #XPathNodeTestParserAttributeState,
	#superclass : #XPathNodeTestParserState,
	#category : #'XPath-Core-Parsers'
}

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForLocalName: aLocalName with: aHandler [
	aHandler handleAttributeNodeTestForLocalName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForName: aName with: aHandler [
	aHandler handleAttributeNodeTestForName: aName
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForNamespaceURI: aURI localName: aLocalName with: aHandler [
	aHandler
		handleAttributeNodeTestForNamespaceURI: aURI
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForNamespaceURI: aURI with: aHandler [
	aHandler handleAttributeNodeTestForNamespaceURI: aURI
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForPrefix: aPrefix localName: aLocalName with: aHandler [
	aHandler
		handleAttributeNodeTestForPrefix: aPrefix
		localName: aLocalName
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleNodeTestForPrefix: aPrefix with: aHandler [
	aHandler handleAttributeNodeTestForPrefix: aPrefix
]

{ #category : #handling }
XPathNodeTestParserAttributeState >> handleWildcardNodeTestWith: aHandler [
	aHandler handleAttributeNodeTest
]
