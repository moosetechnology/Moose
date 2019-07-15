"
This is a class for the 'attribute(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathAttributeNodeTestForPrefix,
	#superclass : #XPathAttributeNodeTest,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathAttributeNodeTestForPrefix class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #testing }
XPathAttributeNodeTestForPrefix >> isAttributeNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathAttributeNodeTestForPrefix >> prefix [
	^ prefix
]

{ #category : #accessing }
XPathAttributeNodeTestForPrefix >> prefix: aPrefix [
	prefix := aPrefix
]

{ #category : #printing }
XPathAttributeNodeTestForPrefix >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]

{ #category : #evaluating }
XPathAttributeNodeTestForPrefix >> value: aNode [
	^ aNode isAttribute
		and: [aNode prefix = self prefix]
]
