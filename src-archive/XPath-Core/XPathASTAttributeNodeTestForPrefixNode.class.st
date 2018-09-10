"
This is an AST node class for the 'attribute(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForPrefixNode,
	#superclass : #XPathASTAttributeNodeTestNode,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForPrefixNode class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #visiting }
XPathASTAttributeNodeTestForPrefixNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForPrefix: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForPrefixNode >> isAttributeNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForPrefixNode >> prefix [
	^ prefix ifNil: [prefix := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForPrefixNode >> prefix: aPrefix [
	prefix := aPrefix
]
