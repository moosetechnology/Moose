"
This is a class for the 'namespace(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathNamespaceTestForNamespaceURIAndLocalName,
	#superclass : #XPathNamespaceTestForNamespaceURI,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNamespaceTestForNamespaceURIAndLocalName class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #testing }
XPathNamespaceTestForNamespaceURIAndLocalName >> isNamespaceNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathNamespaceTestForNamespaceURIAndLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathNamespaceTestForNamespaceURIAndLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathNamespaceTestForNamespaceURIAndLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: (self localName expandWithXMLNamespaceURI: self namespaceURI);
		nextPut: $).
]

{ #category : #evaluating }
XPathNamespaceTestForNamespaceURIAndLocalName >> value: aNode [
	^ aNode isNamespace
		and: [aNode localName = self localName
			and: [aNode namespaceURI = self namespaceURI]]
]
