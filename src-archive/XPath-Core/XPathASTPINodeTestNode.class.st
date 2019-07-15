"
This is an AST node class for the 'processing-instruction()' type test.
"
Class {
	#name : #XPathASTPINodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTPINodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPINodeTest: self
]

{ #category : #testing }
XPathASTPINodeTestNode >> isPINodeTest [
	^ true
]

{ #category : #accessing }
XPathASTPINodeTestNode >> nodeType [
	^ XPathPINodeType new
]
