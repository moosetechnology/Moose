"
This is an AST node class for '!=' not equals expressions.
"
Class {
	#name : #XPathASTNotEqualsExpressionNode,
	#superclass : #XPathASTEqualityExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTNotEqualsExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNotEqualsExpression: self
]

{ #category : #testing }
XPathASTNotEqualsExpressionNode >> isNotEqualsExpression [
	^ true
]

{ #category : #accessing }
XPathASTNotEqualsExpressionNode >> operatorName [
	^ '!='
]
