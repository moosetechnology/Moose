"
This is a class for the 'element(name)' type test or for the 'name' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathElementNodeTestForName,
	#superclass : #XPathElementNodeTest,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathElementNodeTestForName class >> name: aName [
	^ self new name: aName
]

{ #category : #testing }
XPathElementNodeTestForName >> isElementNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathElementNodeTestForName >> name [
	^ name
]

{ #category : #accessing }
XPathElementNodeTestForName >> name: aName [
	name := aName
]

{ #category : #printing }
XPathElementNodeTestForName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]

{ #category : #evaluating }
XPathElementNodeTestForName >> value: aNode [
	^ aNode isElement
		and: [aNode name = self name]
]
