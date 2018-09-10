"
This is an AST node class for the negation operator, which should return its operand converted to a number and negated.
"
Class {
	#name : #XPathASTNegationExpressionNode,
	#superclass : #XPathASTUnaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTNegationExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNegationExpression: self
]

{ #category : #defaults }
XPathASTNegationExpressionNode >> defaultTypeClass [
	^ XPathNumberValueType
]

{ #category : #testing }
XPathASTNegationExpressionNode >> isNegationExpression [
	^ true
]

{ #category : #accessing }
XPathASTNegationExpressionNode >> operatorName [
	^ '-'
]
