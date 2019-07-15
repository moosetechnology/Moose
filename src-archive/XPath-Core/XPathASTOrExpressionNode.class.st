"
This is an AST node class for 'or' expressions. The evaluation should short-curcuit so that the other expression is only evaluated if the first evaluates as false.
"
Class {
	#name : #XPathASTOrExpressionNode,
	#superclass : #XPathASTBinaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTOrExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitOrExpression: self
]

{ #category : #defaults }
XPathASTOrExpressionNode >> defaultTypeClass [
	^ XPathBooleanValueType
]

{ #category : #testing }
XPathASTOrExpressionNode >> isOrExpression [
	^ true
]

{ #category : #accessing }
XPathASTOrExpressionNode >> operatorName [
	^ 'or'
]
