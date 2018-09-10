"
This is an AST node class for '>' greater than expressions.
"
Class {
	#name : #XPathASTGreaterThanExpressionNode,
	#superclass : #XPathASTRelationalExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTGreaterThanExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitGreaterThanExpression: self
]

{ #category : #testing }
XPathASTGreaterThanExpressionNode >> isGreaterThanExpression [
	^ true
]

{ #category : #accessing }
XPathASTGreaterThanExpressionNode >> operatorName [
	^ '>'
]
