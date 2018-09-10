"
This is a base class for AST nodes that have subexpressions.
"
Class {
	#name : #XPathASTNodeWithExpression,
	#superclass : #XPathASTNode,
	#instVars : [
		'expression'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNodeWithExpression class >> expression: anExpression [
	^ self new expression: anExpression
]

{ #category : #visiting }
XPathASTNodeWithExpression >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNodeWithExpression: self
]

{ #category : #accessing }
XPathASTNodeWithExpression >> expression [
	^ expression ifNil: [expression := XPathASTNullNode new]
]

{ #category : #accessing }
XPathASTNodeWithExpression >> expression: anExpression [
	expression := self beParentOf: anExpression
]

{ #category : #testing }
XPathASTNodeWithExpression >> hasLiteralExpression [
	^ self expression isLiteral
]

{ #category : #testing }
XPathASTNodeWithExpression >> hasNonLiteralExpression [
	^ self expression isLiteral not
]

{ #category : #testing }
XPathASTNodeWithExpression >> hasNumberLiteralExpression [
	^ self expression isNumberLiteral
]

{ #category : #testing }
XPathASTNodeWithExpression >> isNodeWithExpression [
	^ true
]
