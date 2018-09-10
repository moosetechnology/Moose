"
This is an AST node class for '<' less than expressions.
"
Class {
	#name : #XPathASTLessThanExpressionNode,
	#superclass : #XPathASTRelationalExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTLessThanExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitLessThanExpression: self
]

{ #category : #testing }
XPathASTLessThanExpressionNode >> isLessThanExpression [
	^ true
]

{ #category : #accessing }
XPathASTLessThanExpressionNode >> operatorName [
	^ '<'
]
