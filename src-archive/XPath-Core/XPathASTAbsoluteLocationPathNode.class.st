"
This is an AST node class for absolute location paths whose root node is the root of the tree the context node is part of.
"
Class {
	#name : #XPathASTAbsoluteLocationPathNode,
	#superclass : #XPathASTLocationPathNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAbsoluteLocationPathNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAbsoluteLocationPath: self
]

{ #category : #testing }
XPathASTAbsoluteLocationPathNode >> isAbsoluteLocationPath [
	^ true
]
