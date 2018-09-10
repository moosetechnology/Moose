"
This is an AST node class for 'child::' steps.
"
Class {
	#name : #XPathASTChildStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTChildStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitChildStep: self
]

{ #category : #accessing }
XPathASTChildStepNode >> axisName [
	^ 'child'
]

{ #category : #testing }
XPathASTChildStepNode >> isChildStep [
	^ true
]

{ #category : #testing }
XPathASTChildStepNode >> isForwardAxisStep [
	^ true
]
