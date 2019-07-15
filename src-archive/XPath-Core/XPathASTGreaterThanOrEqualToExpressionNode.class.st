"
This is an AST node class for '>=' greater than or equal to expressions.
"
Class {
	#name : #XPathASTGreaterThanOrEqualToExpressionNode,
	#superclass : #XPathASTRelationalExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTGreaterThanOrEqualToExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitGreaterThanOrEqualToExpression: self
]

{ #category : #testing }
XPathASTGreaterThanOrEqualToExpressionNode >> isGreaterThanOrEqualToExpression [
	^ true
]

{ #category : #accessing }
XPathASTGreaterThanOrEqualToExpressionNode >> operatorName [
	^ '>='
]
