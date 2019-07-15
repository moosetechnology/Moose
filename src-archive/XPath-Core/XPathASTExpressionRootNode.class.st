"
This is an AST node class to wrap the root node of a parsed XPath expression.
"
Class {
	#name : #XPathASTExpressionRootNode,
	#superclass : #XPathASTNodeWithExpression,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTExpressionRootNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitExpressionRoot: self
]

{ #category : #testing }
XPathASTExpressionRootNode >> isExpressionRoot [
	^ true
]

{ #category : #accessing }
XPathASTExpressionRootNode >> type [
	^ self expression type
]

{ #category : #accessing }
XPathASTExpressionRootNode >> type: aType [
	self expression type: aType
]
