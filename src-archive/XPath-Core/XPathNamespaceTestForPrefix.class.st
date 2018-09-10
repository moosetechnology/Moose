"
This is a class for the 'namespace(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathNamespaceTestForPrefix,
	#superclass : #XPathNamespaceTest,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation'
}

{ #category : #'instance creation' }
XPathNamespaceTestForPrefix class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #testing }
XPathNamespaceTestForPrefix >> isNamespaceNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathNamespaceTestForPrefix >> prefix [
	^ prefix
]

{ #category : #accessing }
XPathNamespaceTestForPrefix >> prefix: aPrefix [
	prefix := aPrefix
]

{ #category : #printing }
XPathNamespaceTestForPrefix >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self prefix;
		nextPut: $).
]

{ #category : #evaluating }
XPathNamespaceTestForPrefix >> value: aNode [
	^ aNode isNamespace
		and: [aNode prefix = self prefix]
]
