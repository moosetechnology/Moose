"
This is an AST node class for the 'attribute(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode,
	#superclass : #XPathASTAttributeNodeTestForNamespaceURINode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForNamespaceURIAndLocalName: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode >> isAttributeNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNamespaceURIAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
