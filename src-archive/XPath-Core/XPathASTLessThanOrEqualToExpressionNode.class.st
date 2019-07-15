"
This is an AST node class for '<=' less than or equal to expressions.
"
Class {
	#name : #XPathASTLessThanOrEqualToExpressionNode,
	#superclass : #XPathASTRelationalExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTLessThanOrEqualToExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitLessThanOrEqualToExpression: self
]

{ #category : #testing }
XPathASTLessThanOrEqualToExpressionNode >> isLessThanOrEqualToExpression [
	^ true
]

{ #category : #accessing }
XPathASTLessThanOrEqualToExpressionNode >> operatorName [
	^ '<='
]
