"
This is a class for the 'namespace(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathNamespaceTestForNamespaceURI,
	#superclass : #XPathNamespaceTest,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNamespaceTestForNamespaceURI class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #testing }
XPathNamespaceTestForNamespaceURI >> isNamespaceNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathNamespaceTestForNamespaceURI >> namespaceURI [
	^ namespaceURI
]

{ #category : #accessing }
XPathNamespaceTestForNamespaceURI >> namespaceURI: aURI [
	namespaceURI := aURI
]

{ #category : #printing }
XPathNamespaceTestForNamespaceURI >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self namespaceURI;
		nextPut: $).
]

{ #category : #evaluating }
XPathNamespaceTestForNamespaceURI >> value: aNode [
	^ aNode isNamespace
		and: [aNode namespaceURI = self namespaceURI]
]
