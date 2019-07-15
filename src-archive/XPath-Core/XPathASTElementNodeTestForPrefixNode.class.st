"
This is an AST node class for the 'element(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForPrefixNode,
	#superclass : #XPathASTElementNodeTestNode,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForPrefixNode class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #visiting }
XPathASTElementNodeTestForPrefixNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForPrefix: self
]

{ #category : #testing }
XPathASTElementNodeTestForPrefixNode >> isElementNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForPrefixNode >> prefix [
	^ prefix ifNil: [prefix := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForPrefixNode >> prefix: aPrefix [
	prefix := aPrefix
]
