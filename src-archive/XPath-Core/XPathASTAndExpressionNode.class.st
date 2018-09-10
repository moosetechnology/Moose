"
This is an AST node class for 'and' expressions. The evaluation should short-curcuit so that the other expression is only evaluated if the first evaluates as true.
"
Class {
	#name : #XPathASTAndExpressionNode,
	#superclass : #XPathASTBinaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAndExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAndExpression: self
]

{ #category : #defaults }
XPathASTAndExpressionNode >> defaultTypeClass [
	^ XPathBooleanValueType
]

{ #category : #testing }
XPathASTAndExpressionNode >> isAndExpression [
	^ true
]

{ #category : #accessing }
XPathASTAndExpressionNode >> operatorName [
	^ 'and'
]
