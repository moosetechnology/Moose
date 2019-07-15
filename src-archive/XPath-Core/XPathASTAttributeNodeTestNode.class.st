"
This is an AST node class for the 'attribute()' type test or for the '*' type test when the principal node type of the axis is 'attribute'.
"
Class {
	#name : #XPathASTAttributeNodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAttributeNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAttributeNodeTest: self
]

{ #category : #testing }
XPathASTAttributeNodeTestNode >> isAttributeNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTAttributeNodeTestNode >> nodeType [
	^ XPathAttributeNodeType new
]
