"
This is an AST node class for '*' multiplication expressions.
"
Class {
	#name : #XPathASTMultiplicationExpressionNode,
	#superclass : #XPathASTMultiplicativeExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTMultiplicationExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitMultiplicationExpression: self
]

{ #category : #testing }
XPathASTMultiplicationExpressionNode >> isMultiplicationExpression [
	^ true
]

{ #category : #accessing }
XPathASTMultiplicationExpressionNode >> operatorName [
	^ '*'
]
