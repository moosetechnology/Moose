"
This is an AST node class for 'namespace::' steps.
"
Class {
	#name : #XPathASTNamespaceStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTNamespaceStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitNamespaceStep: self
]

{ #category : #accessing }
XPathASTNamespaceStepNode >> axisName [
	^ 'namespace'
]

{ #category : #testing }
XPathASTNamespaceStepNode >> isForwardAxisStep [
	^ true
]

{ #category : #testing }
XPathASTNamespaceStepNode >> isNamespaceStep [
	^ true
]

{ #category : #accessing }
XPathASTNamespaceStepNode >> principalNodeType [
	^ XPathNamespaceNodeType new
]
