"
This is an AST node class for the 'element(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForNamespaceURIAndLocalNameNode,
	#superclass : #XPathASTElementNodeTestForNamespaceURINode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForNamespaceURIAndLocalName: self
]

{ #category : #testing }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode >> isElementNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForNamespaceURIAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
