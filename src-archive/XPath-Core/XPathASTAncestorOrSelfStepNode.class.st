"
This is an AST node class for 'ancestor-or-self::' steps.
"
Class {
	#name : #XPathASTAncestorOrSelfStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTAncestorOrSelfStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitAncestorOrSelfStep: self
]

{ #category : #accessing }
XPathASTAncestorOrSelfStepNode >> axisName [
	^ 'ancestor-or-self'
]

{ #category : #testing }
XPathASTAncestorOrSelfStepNode >> isAncestorOrSelfStep [
	^ true
]

{ #category : #testing }
XPathASTAncestorOrSelfStepNode >> isReverseAxisStep [
	^ true
]
