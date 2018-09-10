"
This is an AST node class for 'parent::' steps.
"
Class {
	#name : #XPathASTParentStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTParentStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitParentStep: self
]

{ #category : #accessing }
XPathASTParentStepNode >> axisName [
	^ 'parent'
]

{ #category : #testing }
XPathASTParentStepNode >> isForwardAxisStep [
	"according to the spec, this is a forward axis"
	^ true
]

{ #category : #testing }
XPathASTParentStepNode >> isParentStep [
	^ true
]
