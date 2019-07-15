"
This is a class for the 'element(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathElementNodeTestForLocalName,
	#superclass : #XPathElementNodeTest,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathElementNodeTestForLocalName class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #testing }
XPathElementNodeTestForLocalName >> isElementNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathElementNodeTestForLocalName >> localName [
	^ localName
]

{ #category : #accessing }
XPathElementNodeTestForLocalName >> localName: aLocalName [
	localName := aLocalName
]

{ #category : #printing }
XPathElementNodeTestForLocalName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self localName;
		nextPut: $).
]

{ #category : #evaluating }
XPathElementNodeTestForLocalName >> value: aNode [
	^ aNode isElement
		and: [aNode localName = self localName]
]
