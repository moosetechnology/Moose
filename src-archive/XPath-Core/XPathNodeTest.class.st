"
This is a base class for XPath node tests.
"
Class {
	#name : #XPathNodeTest,
	#superclass : #Object,
	#category : #'XPath-Core-Compilation'
}

{ #category : #converting }
XPathNodeTest >> asXPathAttributeAxisNodeTest [
	^ self
]

{ #category : #converting }
XPathNodeTest >> asXPathNamespaceAxisNodeTest [
	^ self
]

{ #category : #converting }
XPathNodeTest >> asXPathNodeTest [
	^ self
]

{ #category : #testing }
XPathNodeTest >> isAnyNodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTestForName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isAttributeNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isCommentNodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTestForName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isElementNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTestForLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTestForName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTestForNamespaceURI [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTestForNamespaceURIAndLocalName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isNamespaceNodeTestForPrefix [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isPINodeTest [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isPINodeTestForName [
	^ false
]

{ #category : #testing }
XPathNodeTest >> isTextNodeTest [
	^ false
]

{ #category : #evaluating }
XPathNodeTest >> value: aNode [
	self subclassResponsibility
]
