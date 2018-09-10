"
This is a base class for literal AST nodes, nodes that represent XPath constructs like strings or numbers that are self-evaluating.
"
Class {
	#name : #XPathASTLiteralNode,
	#superclass : #XPathASTNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #converting }
XPathASTLiteralNode >> asXPathBoolean [
	self subclassResponsibility
]

{ #category : #converting }
XPathASTLiteralNode >> asXPathNumber [
	self subclassResponsibility
]

{ #category : #converting }
XPathASTLiteralNode >> asXPathString [
	self subclassResponsibility
]

{ #category : #testing }
XPathASTLiteralNode >> isLiteral [
	^ true
]
