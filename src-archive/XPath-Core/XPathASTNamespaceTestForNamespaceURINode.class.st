"
This is an AST node class for the 'namespace(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForNamespaceURINode,
	#superclass : #XPathASTNamespaceTestNode,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForNamespaceURINode class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #visiting }
XPathASTNamespaceTestForNamespaceURINode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForNamespaceURI: self
]

{ #category : #testing }
XPathASTNamespaceTestForNamespaceURINode >> isNamespaceNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForNamespaceURINode >> namespaceURI [
	^ namespaceURI ifNil: [namespaceURI := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForNamespaceURINode >> namespaceURI: aURI [
	namespaceURI := aURI
]
