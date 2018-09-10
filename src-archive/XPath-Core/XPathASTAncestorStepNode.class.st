"
This is an AST node class for 'ancestor::' steps.
"
Class {
	#name : #XPathASTAncestorStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAncestorStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAncestorStep: self
]

{ #category : #accessing }
XPathASTAncestorStepNode >> axisName [
	^ 'ancestor'
]

{ #category : #testing }
XPathASTAncestorStepNode >> isAncestorStep [
	^ true
]

{ #category : #testing }
XPathASTAncestorStepNode >> isReverseAxisStep [
	^ true
]
