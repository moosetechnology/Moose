"
This is a class for the 'attribute(name)' type test or for the 'name' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTestForName,
	#superclass : #XPathAttributeNodeTest,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathAttributeNodeTestForName class >> name: aName [
	^ self new name: aName
]

{ #category : #testing }
XPathAttributeNodeTestForName >> isAttributeNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeTestForName >> name [
	^ name
]

{ #category : #accessing }
XPathAttributeNodeTestForName >> name: aName [
	name := aName
]

{ #category : #printing }
XPathAttributeNodeTestForName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]

{ #category : #evaluating }
XPathAttributeNodeTestForName >> value: aNode [
	^ aNode isAttribute
		and: [aNode name = self name]
]
