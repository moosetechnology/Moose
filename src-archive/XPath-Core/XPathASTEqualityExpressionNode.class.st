"
This is a base class for AST equality expression nodes of the same precedence.
"
Class {
	#name : #XPathASTEqualityExpressionNode,
	#superclass : #XPathASTBinaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #defaults }
XPathASTEqualityExpressionNode >> defaultTypeClass [
	^ XPathBooleanValueType
]

{ #category : #testing }
XPathASTEqualityExpressionNode >> isEqualityExpression [
	^ true
]
