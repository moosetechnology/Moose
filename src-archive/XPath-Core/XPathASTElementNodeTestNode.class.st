"
This is an AST node class for the 'element()' type test or for '*' type tests when the principal node type of the axis is an element.
"
Class {
	#name : #XPathASTElementNodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTElementNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitElementNodeTest: self
]

{ #category : #testing }
XPathASTElementNodeTestNode >> isElementNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTElementNodeTestNode >> nodeType [
	^ XPathElementNodeType new
]
