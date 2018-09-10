"
This is an AST node class to wrap argument expressions.
"
Class {
	#name : #XPathASTArgumentNode,
	#superclass : #XPathASTNodeWithExpression,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTArgumentNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitArgument: self
]

{ #category : #testing }
XPathASTArgumentNode >> isArgument [
	^ true
]

{ #category : #accessing }
XPathASTArgumentNode >> type [
	^ self expression type
]

{ #category : #accessing }
XPathASTArgumentNode >> type: aType [
	self expression type: aType
]
