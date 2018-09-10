"
This is a class for the 'attribute(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTestForNamespaceURI,
	#superclass : #XPathAttributeNodeTest,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathAttributeNodeTestForNamespaceURI class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #testing }
XPathAttributeNodeTestForNamespaceURI >> isAttributeNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeTestForNamespaceURI >> namespaceURI [
	^ namespaceURI
]

{ #category : #accessing }
XPathAttributeNodeTestForNamespaceURI >> namespaceURI: aURI [
	namespaceURI := aURI
]

{ #category : #printing }
XPathAttributeNodeTestForNamespaceURI >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]

{ #category : #evaluating }
XPathAttributeNodeTestForNamespaceURI >> value: aNode [
	^ aNode isAttribute
		and: [aNode namespaceURI = self namespaceURI]
]
