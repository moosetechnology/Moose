"
This is a class for the 'attribute(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTestForLocalName,
	#superclass : #XPathAttributeNodeTest,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathAttributeNodeTestForLocalName class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #testing }
XPathAttributeNodeTestForLocalName >> isAttributeNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeTestForLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathAttributeNodeTestForLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathAttributeNodeTestForLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]

{ #category : #evaluating }
XPathAttributeNodeTestForLocalName >> value: aNode [
	^ aNode isAttribute
		and: [aNode localName = self localName]
]
