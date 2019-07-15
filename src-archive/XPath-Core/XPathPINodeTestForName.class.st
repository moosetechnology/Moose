"
This is a class for the 'processing-instruction(name)' type test.
"
Class {
	#name : #XPathPINodeTestForName,
	#superclass : #XPathPINodeTest,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathPINodeTestForName class >> name: aName [
	^ self new name: aName
]

{ #category : #testing }
XPathPINodeTestForName >> isPINodeTestForName [
	^ true
]

{ #category : #accessing }
XPathPINodeTestForName >> name [
	^ name
]

{ #category : #accessing }
XPathPINodeTestForName >> name: aName [
	name := aName
]

{ #category : #evaluating }
XPathPINodeTestForName >> value: aNode [
	^ aNode isPI
		and: [aNode target = self name]
]
