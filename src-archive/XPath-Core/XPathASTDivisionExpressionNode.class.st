"
This is an AST node class for 'div' division expressions.
"
Class {
	#name : #XPathASTDivisionExpressionNode,
	#superclass : #XPathASTMultiplicativeExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTDivisionExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitDivisionExpression: self
]

{ #category : #testing }
XPathASTDivisionExpressionNode >> isDivisionExpression [
	^ true
]

{ #category : #accessing }
XPathASTDivisionExpressionNode >> operatorName [
	^ 'div'
]
