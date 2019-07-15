"
This is a base class for unary operator expression AST node classes.
"
Class {
	#name : #XPathASTUnaryOperatorExpressionNode,
	#superclass : #XPathASTNodeWithExpression,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTUnaryOperatorExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitUnaryOperatorExpression: self
]

{ #category : #testing }
XPathASTUnaryOperatorExpressionNode >> isOperatorExpression [
	^ true
]

{ #category : #testing }
XPathASTUnaryOperatorExpressionNode >> isUnaryOperatorExpression [
	^ true
]

{ #category : #accessing }
XPathASTUnaryOperatorExpressionNode >> operatorName [
	self subclassResponsibility
]
