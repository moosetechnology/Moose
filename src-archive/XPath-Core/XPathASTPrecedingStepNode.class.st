"
This is an AST node class for 'preceding::' steps.
"
Class {
	#name : #XPathASTPrecedingStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTPrecedingStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPrecedingStep: self
]

{ #category : #accessing }
XPathASTPrecedingStepNode >> axisName [
	^ 'preceding'
]

{ #category : #testing }
XPathASTPrecedingStepNode >> isPrecedingStep [
	^ true
]

{ #category : #testing }
XPathASTPrecedingStepNode >> isReverseAxisStep [
	^ true
]
