"
This is an AST node class for the 'attribute(prefix:localName)' type test or for the 'prefix:localName' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForPrefixAndLocalNameNode,
	#superclass : #XPathASTAttributeNodeTestForPrefixNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode class >> prefix: aPrefix localName: aLocalName [
	^ (self prefix: aPrefix)
		localName: aLocalName
]

{ #category : #visiting }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForPrefixAndLocalName: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode >> isAttributeNodeTestForPrefixAndLocalName [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForPrefixAndLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
