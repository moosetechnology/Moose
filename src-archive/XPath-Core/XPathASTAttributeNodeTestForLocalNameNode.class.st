"
This is an AST node class for the 'attribute(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForLocalNameNode,
	#superclass : #XPathASTAttributeNodeTestNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForLocalNameNode class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #visiting }
XPathASTAttributeNodeTestForLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForLocalName: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForLocalNameNode >> isAttributeNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
