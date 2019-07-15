"
This is an AST node class for 'descendant-or-self::' steps.
"
Class {
	#name : #XPathASTDescendantOrSelfStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTDescendantOrSelfStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitDescendantOrSelfStep: self
]

{ #category : #accessing }
XPathASTDescendantOrSelfStepNode >> axisName [
	^ 'descendant-or-self'
]

{ #category : #testing }
XPathASTDescendantOrSelfStepNode >> isDescendantOrSelfStep [
	^ true
]

{ #category : #testing }
XPathASTDescendantOrSelfStepNode >> isForwardAxisStep [
	^ true
]
