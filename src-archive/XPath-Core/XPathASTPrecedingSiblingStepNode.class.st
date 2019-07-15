"
This is an AST node class for 'preceding-sibling::' steps.
"
Class {
	#name : #XPathASTPrecedingSiblingStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTPrecedingSiblingStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitPrecedingSiblingStep: self
]

{ #category : #accessing }
XPathASTPrecedingSiblingStepNode >> axisName [
	^ 'preceding-sibling'
]

{ #category : #testing }
XPathASTPrecedingSiblingStepNode >> isPrecedingSiblingStep [
	^ true
]

{ #category : #testing }
XPathASTPrecedingSiblingStepNode >> isReverseAxisStep [
	^ true
]
