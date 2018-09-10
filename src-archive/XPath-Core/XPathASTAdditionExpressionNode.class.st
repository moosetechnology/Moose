"
This is an AST node class for addition '+' expressions.
"
Class {
	#name : #XPathASTAdditionExpressionNode,
	#superclass : #XPathASTAdditiveExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAdditionExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAdditionExpression: self
]

{ #category : #testing }
XPathASTAdditionExpressionNode >> isAdditionExpression [
	^ true
]

{ #category : #accessing }
XPathASTAdditionExpressionNode >> operatorName [
	^ '+'
]
