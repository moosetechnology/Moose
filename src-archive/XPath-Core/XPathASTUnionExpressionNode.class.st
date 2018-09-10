"
This is an AST node class for union expressions. Both subexpressions must evaluate to node sets.
"
Class {
	#name : #XPathASTUnionExpressionNode,
	#superclass : #XPathASTBinaryOperatorExpressionNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTUnionExpressionNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitUnionExpression: self
]

{ #category : #defaults }
XPathASTUnionExpressionNode >> defaultTypeClass [
	^ XPathNodeSetValueType
]

{ #category : #testing }
XPathASTUnionExpressionNode >> isUnionExpression [
	^ true
]

{ #category : #accessing }
XPathASTUnionExpressionNode >> operatorName [
	^ '|'
]
