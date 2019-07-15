"
This is a class for the 'namespace(name)' type test or for the 'name' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathNamespaceTestForName,
	#superclass : #XPathNamespaceTest,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNamespaceTestForName class >> name: aName [
	^ self new name: aName
]

{ #category : #testing }
XPathNamespaceTestForName >> isNamespaceNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathNamespaceTestForName >> name [
	^ name
]

{ #category : #accessing }
XPathNamespaceTestForName >> name: aName [
	name := aName
]

{ #category : #printing }
XPathNamespaceTestForName >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $).
]

{ #category : #evaluating }
XPathNamespaceTestForName >> value: aNode [
	^ aNode isNamespace
		and: [aNode name = self name]
]
