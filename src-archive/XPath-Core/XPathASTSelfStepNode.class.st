"
This is an AST node class for 'self::' steps.
"
Class {
	#name : #XPathASTSelfStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTSelfStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitSelfStep: self
]

{ #category : #accessing }
XPathASTSelfStepNode >> axisName [
	^ 'self'
]

{ #category : #testing }
XPathASTSelfStepNode >> isForwardAxisStep [
	^ true
]

{ #category : #testing }
XPathASTSelfStepNode >> isSelfStep [
	^ true
]
