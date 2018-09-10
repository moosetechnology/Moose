"
This is an AST node class for relative location paths whose root node is the context node.
"
Class {
	#name : #XPathASTRelativeLocationPathNode,
	#superclass : #XPathASTLocationPathNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTRelativeLocationPathNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitRelativeLocationPath: self
]

{ #category : #testing }
XPathASTRelativeLocationPathNode >> isRelativeLocationPath [
	^ true
]
