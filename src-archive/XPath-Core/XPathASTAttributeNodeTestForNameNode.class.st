"
This is an AST node class for the 'attribute(name)' type test or for the 'name' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestForNameNode,
	#superclass : #XPathASTAttributeNodeTestNode,
	#instVars : [
		'name'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTAttributeNodeTestForNameNode class >> name: aName [
	^ self new name: aName
]

{ #category : #visiting }
XPathASTAttributeNodeTestForNameNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTestForName: self
]

{ #category : #testing }
XPathASTAttributeNodeTestForNameNode >> isAttributeNodeTestForName [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNameNode >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XPathASTAttributeNodeTestForNameNode >> name: aName [
	name := aName
]
