"
This is an AST node class for the 'node()' type test for any node.
"
Class {
	#name : #XPathASTAnyNodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAnyNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAnyNodeTest: self
]

{ #category : #testing }
XPathASTAnyNodeTestNode >> isAnyNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTAnyNodeTestNode >> nodeType [
	^ XPathNodeType new
]
