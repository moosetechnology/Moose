"
This is an AST node class for the 'comment()' type test.
"
Class {
	#name : #XPathASTCommentNodeTestNode,
	#superclass : #XPathASTNodeTestNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTCommentNodeTestNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitCommentNodeTest: self
]

{ #category : #testing }
XPathASTCommentNodeTestNode >> isCommentNodeTest [
	^ true
]

{ #category : #accessing }
XPathASTCommentNodeTestNode >> nodeType [
	^ XPathCommentNodeType new
]
