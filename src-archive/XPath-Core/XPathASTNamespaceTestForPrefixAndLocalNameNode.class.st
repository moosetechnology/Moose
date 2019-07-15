"
This is an AST node class for the 'namespace(prefix:localName)' type test or for the 'prefix:localName' type test when the principal node type of the axis is 'namespace'.
"
Class {
	#name : #XPathASTNamespaceTestForPrefixAndLocalNameNode,
	#superclass : #XPathASTNamespaceTestForPrefixNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNamespaceTestForPrefixAndLocalNameNode class >> prefix: aPrefix localName: aLocalName [
	^ (self prefix: aPrefix)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTNamespaceTestForPrefixAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceNodeTestForPrefixAndLocalName: self
]

{ #category : #testing }
XPathASTNamespaceTestForPrefixAndLocalNameNode >> isNamespaceNodeTestForPrefixAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceTestForPrefixAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTNamespaceTestForPrefixAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
