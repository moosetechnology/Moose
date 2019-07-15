"
This is an AST node class for '=' equals expressions.
"
Class {
	#name : #XPathASTEqualsExpressionNode,
	#superclass : #XPathASTEqualityExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTEqualsExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitEqualsExpression: self
]

{ #category : #testing }
XPathASTEqualsExpressionNode >> isEqualsExpression [
	^ true
]

{ #category : #accessing }
XPathASTEqualsExpressionNode >> operatorName [
	^ '='
]
