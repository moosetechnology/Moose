"
This is an AST node class for the 'element(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForNamespaceURINode,
	#superclass : #XPathASTElementNodeTestNode,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForNamespaceURINode class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #visiting }
XPathASTElementNodeTestForNamespaceURINode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForNamespaceURI: self
]

{ #category : #testing }
XPathASTElementNodeTestForNamespaceURINode >> isElementNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForNamespaceURINode >> namespaceURI [
	^ namespaceURI ifNil: [namespaceURI := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForNamespaceURINode >> namespaceURI: aURI [
	namespaceURI := aURI
]
