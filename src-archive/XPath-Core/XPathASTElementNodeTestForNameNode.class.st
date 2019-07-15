"
This is an AST node class for the 'element(name)' type test or for the 'name' type test when the principal node type of the axis is 'element'.
"
Class {
	#name : #XPathASTElementNodeTestForNameNode,
	#superclass : #XPathASTElementNodeTestNode,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTElementNodeTestForNameNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTElementNodeTestForNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTestForName: self
]

{ #category : #testing }
XPathASTElementNodeTestForNameNode >> isElementNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestForNameNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTElementNodeTestForNameNode >> name: aName [
	name := aName
]
