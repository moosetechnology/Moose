"
This is a class for the 'namespace(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathNamespaceTestForLocalName,
	#superclass : #XPathNamespaceTest,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNamespaceTestForLocalName class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #testing }
XPathNamespaceTestForLocalName >> isNamespaceNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathNamespaceTestForLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathNamespaceTestForLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathNamespaceTestForLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]

{ #category : #evaluating }
XPathNamespaceTestForLocalName >> value: aNode [
	^ aNode isNamespace
		and: [aNode localName = self localName]
]
