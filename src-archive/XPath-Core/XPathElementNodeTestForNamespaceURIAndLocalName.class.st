"
This is a class for the 'element(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathElementNodeTestForNamespaceURIAndLocalName,
	#superclass : #XPathElementNodeTestForNamespaceURI,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathElementNodeTestForNamespaceURIAndLocalName class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #testing }
XPathElementNodeTestForNamespaceURIAndLocalName >> isElementNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathElementNodeTestForNamespaceURIAndLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathElementNodeTestForNamespaceURIAndLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathElementNodeTestForNamespaceURIAndLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: (self localName expandWithXMLNamespaceURI: self namespaceURI);
		nextPut: $).
]

{ #category : #evaluating }
XPathElementNodeTestForNamespaceURIAndLocalName >> value: aNode [
	^ aNode isElement
		and: [aNode localName = self localName
			and: [aNode namespaceURI = self namespaceURI]]
]
