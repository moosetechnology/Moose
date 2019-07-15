"
This is a class for the 'element(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathElementNodeTestForPrefix,
	#superclass : #XPathElementNodeTest,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathElementNodeTestForPrefix class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #testing }
XPathElementNodeTestForPrefix >> isElementNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathElementNodeTestForPrefix >> prefix [
	^ prefix
]

{ #category : #accessing }
XPathElementNodeTestForPrefix >> prefix: aPrefix [
	prefix := aPrefix
]

{ #category : #printing }
XPathElementNodeTestForPrefix >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]

{ #category : #evaluating }
XPathElementNodeTestForPrefix >> value: aNode [
	^ aNode isElement
		and: [aNode prefix = self prefix]
]
