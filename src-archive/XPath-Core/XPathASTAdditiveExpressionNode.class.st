"
This is a base class for additive binary operator expression AST nodes of the same precedence.
"
Class {
	#name : #XPathASTAdditiveExpressionNode,
	#superclass : #XPathASTBinaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #defaults }
XPathASTAdditiveExpressionNode >> defaultTypeClass [
	^ XPathNumberValueType
]

{ #category : #testing }
XPathASTAdditiveExpressionNode >> isAdditiveExpression [
	^ true
]
