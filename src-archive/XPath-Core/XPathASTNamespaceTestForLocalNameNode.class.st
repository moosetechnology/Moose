"
This is an AST node class for the 'namespace(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForLocalNameNode,
	#superclass : #XPathASTNamespaceTestNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForLocalNameNode class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #visiting }
XPathASTNamespaceTestForLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForLocalName: self
]

{ #category : #testing }
XPathASTNamespaceTestForLocalNameNode >> isNamespaceNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
