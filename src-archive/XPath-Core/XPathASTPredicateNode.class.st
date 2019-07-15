"
This is an AST node class for wrapping step and filter expression predicates.
"
Class {
	#name : #XPathASTPredicateNode,
	#superclass : #XPathASTNodeWithExpression,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTPredicateNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPredicate: self
]

{ #category : #testing }
XPathASTPredicateNode >> isPredicate [
	^ true
]

{ #category : #accessing }
XPathASTPredicateNode >> type [
	^ self expression type
]

{ #category : #accessing }
XPathASTPredicateNode >> type: aType [
	self expression type: aType
]
