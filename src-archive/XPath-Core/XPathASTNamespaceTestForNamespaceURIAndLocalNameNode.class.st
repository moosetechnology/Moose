"
This is an AST node class for the 'namespace(Q{namespaceURI}localName)' type test or for the 'Q{namespaceURI}localName' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForNamespaceURIAndLocalNameNode,
	#superclass : #XPathASTNamespaceTestForNamespaceURINode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForNamespaceURIAndLocalNameNode class >> namespaceURI: aURI localName: aLocalName [
	^ (self namespaceURI: aURI)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTNamespaceTestForNamespaceURIAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForNamespaceURIAndLocalName: self
]

{ #category : #testing }
XPathASTNamespaceTestForNamespaceURIAndLocalNameNode >> isNamespaceNodeTestForNamespaceURIAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForNamespaceURIAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForNamespaceURIAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
