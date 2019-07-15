"
This is an AST node class for the 'element(*:localName)' type test or for the '*:localName' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForLocalNameNode,
	#superclass : #XPathASTElementNodeTestNode,
	#instVars : [
		'localName'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForLocalNameNode class >> localName: aLocalName [
	^ self new localName: aLocalName
]

{ #category : #visiting }
XPathASTElementNodeTestForLocalNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForLocalName: self
]

{ #category : #testing }
XPathASTElementNodeTestForLocalNameNode >> isElementNodeTestForLocalName [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForLocalNameNode >> localName [
	^ localName ifNil: [localName := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForLocalNameNode >> localName: aLocalName [
	localName := aLocalName
]
