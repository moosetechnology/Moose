"
This is an AST node class for the 'text()' type test.
"
Class {
	#name : #XPathASTTextNodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTTextNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitTextNodeTest: self
]

{ #category : #testing }
XPathASTTextNodeTestNode >> isTextNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTTextNodeTestNode >> nodeType [
	^ XPathTextNodeType new
]
