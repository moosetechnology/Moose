"
This is an AST node class for the 'element(prefix:localName)' type test or for the 'prefix:localName' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForPrefixAndLocalNameNode,
	#superclass : #XPathASTElementNodeTestForPrefixNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForPrefixAndLocalNameNode class >> prefix: aPrefix localName: aLocalName [
	^ (self prefix: aPrefix)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTElementNodeTestForPrefixAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForPrefixAndLocalName: self
]

{ #category : #testing }
XPathASTElementNodeTestForPrefixAndLocalNameNode >> isElementNodeTestForPrefixAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForPrefixAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForPrefixAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
