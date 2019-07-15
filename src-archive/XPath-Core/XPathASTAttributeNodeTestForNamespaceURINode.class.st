"
This is an AST node class for the 'attribute(Q{namespaceURI}*)' type test or for the 'Q{namespaceURI}*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForNamespaceURINode,
	#superclass : #XPathASTAttributeNodeTestNode,
	#instVars : [
		'namespaceURI'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForNamespaceURINode class >> namespaceURI: aURI [
	^ self new namespaceURI: aURI
]

{ #category : #visiting }
XPathASTAttributeNodeTestForNamespaceURINode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForNamespaceURI: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForNamespaceURINode >> isAttributeNodeTestForNamespaceURI [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNamespaceURINode >> namespaceURI [
	^ namespaceURI ifNil: [namespaceURI := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNamespaceURINode >> namespaceURI: aURI [
	namespaceURI := aURI
]
