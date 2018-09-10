"
This is a base class for AST node classes that have another subexpression in addition to the first.
"
Class {
	#name : #XPathASTNodeWithOtherExpression,
	#superclass : #XPathASTNodeWithExpression,
	#instVars : [
		'otherExpression'
	],
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #'instance creation' }
XPathASTNodeWithOtherExpression class >> expression: aFirstExpression otherExpression: aSecondExpression [
	^ self new
		expression: aFirstExpression;
		otherExpression: aSecondExpression
]

{ #category : #visiting }
XPathASTNodeWithOtherExpression >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNodeWithOtherExpression: self
]

{ #category : #testing }
XPathASTNodeWithOtherExpression >> hasLiteralExpression [
	^ self expression isLiteral
		or: [self otherExpression isLiteral]
]

{ #category : #testing }
XPathASTNodeWithOtherExpression >> hasNonLiteralExpression [
	^ self expression isLiteral not
		or: [self otherExpression isLiteral not]
]

{ #category : #testing }
XPathASTNodeWithOtherExpression >> hasNumberLiteralExpression [
	^ self expression isNumberLiteral
		or: [self otherExpression isNumberLiteral]
]

{ #category : #testing }
XPathASTNodeWithOtherExpression >> isNodeWithOtherExpression [
	^ true
]

{ #category : #accessing }
XPathASTNodeWithOtherExpression >> otherExpression [
	^ otherExpression ifNil: [XPathASTNullNode new]
]

{ #category : #accessing }
XPathASTNodeWithOtherExpression >> otherExpression: anExpression [
	otherExpression := self beParentOf: anExpression
]
