"
This is a class for the 'attribute(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTestForNamespaceURIAndLocalName,
	#superclass : #XPathAttributeNodeTestForNamespaceURI,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathAttributeNodeTestForNamespaceURIAndLocalName class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #testing }
XPathAttributeNodeTestForNamespaceURIAndLocalName >> isAttributeNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeTestForNamespaceURIAndLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathAttributeNodeTestForNamespaceURIAndLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathAttributeNodeTestForNamespaceURIAndLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: (self localName expandWithXMLNamespaceURI: self namespaceURI);
		nextPut: $).
]

{ #category : #evaluating }
XPathAttributeNodeTestForNamespaceURIAndLocalName >> value: aNode [
	^ aNode isAttribute
		and: [aNode localName = self localName
			and: [aNode namespaceURI = self namespaceURI]]
]
