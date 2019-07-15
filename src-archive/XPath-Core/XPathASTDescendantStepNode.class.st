"
This is an AST node class for 'descendant::' steps.
"
Class {
	#name : #XPathASTDescendantStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTDescendantStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitDescendantStep: self
]

{ #category : #accessing }
XPathASTDescendantStepNode >> axisName [
	^ 'descendant'
]

{ #category : #testing }
XPathASTDescendantStepNode >> isDescendantStep [
	^ true
]

{ #category : #testing }
XPathASTDescendantStepNode >> isForwardAxisStep [
	^ true
]
