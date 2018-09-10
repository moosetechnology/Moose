"
This is a class for the 'element(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathElementNodeTestForNamespaceURI,
	#superclass : #XPathElementNodeTest,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathElementNodeTestForNamespaceURI class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #testing }
XPathElementNodeTestForNamespaceURI >> isElementNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathElementNodeTestForNamespaceURI >> namespaceURI [
	^ namespaceURI
]

{ #category : #accessing }
XPathElementNodeTestForNamespaceURI >> namespaceURI: aURI [
	namespaceURI := aURI
]

{ #category : #printing }
XPathElementNodeTestForNamespaceURI >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]

{ #category : #evaluating }
XPathElementNodeTestForNamespaceURI >> value: aNode [
	^ aNode isElement
		and: [aNode namespaceURI = self namespaceURI]
]
