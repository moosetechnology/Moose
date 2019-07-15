"
This is an AST node class for the 'namespace(prefix:*)' type test or for the 'prefix:*' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForPrefixNode,
	#superclass : #XPathASTNamespaceTestNode,
	#instVars : [
		'prefix'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForPrefixNode class >> prefix: aPrefix [
	^ self new prefix: aPrefix
]

{ #category : #visiting }
XPathASTNamespaceTestForPrefixNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForPrefix: self
]

{ #category : #testing }
XPathASTNamespaceTestForPrefixNode >> isNamespaceNodeTestForPrefix [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForPrefixNode >> prefix [
	^ prefix ifNil: [prefix := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForPrefixNode >> prefix: aPrefix [
	prefix := aPrefix
]
