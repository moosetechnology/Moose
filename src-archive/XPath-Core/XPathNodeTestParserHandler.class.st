"
An abstract class for node test parser handlers. Parsing is controlled by XPathNodeTestParserState classes.
"
Class {
	#name : #XPathNodeTestParserHandler,
	#superclass : #XPathParserHandler,
	#category : #'XPath-Core-Parsers'
}

{ #category : #defaults }
XPathNodeTestParserHandler >> defaultNodeTestParserStateClass [
	self subclassResponsibility
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAnyNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForLocalName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForName: aName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleAttributeNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleCommentNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForLocalName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForName: aName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleElementNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleEmptyNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForLocalName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForName: aName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForNamespaceURI: aURI localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleNamespaceNodeTestForPrefix: aPrefix localName: aLocalName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handlePINodeTest [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handlePINodeTestForName: aName [
]

{ #category : #handling }
XPathNodeTestParserHandler >> handleTextNodeTest [
]
