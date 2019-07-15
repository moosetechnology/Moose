"
This is an AST node class for 'following-sibling::' steps.
"
Class {
	#name : #XPathASTFollowingSiblingStepNode,
	#superclass : #XPathASTStepNode,
	#category : #'XPath-Core-Compilation-AST'
}

{ #category : #visiting }
XPathASTFollowingSiblingStepNode >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitFollowingSiblingStep: self
]

{ #category : #accessing }
XPathASTFollowingSiblingStepNode >> axisName [
	^ 'following-sibling'
]

{ #category : #testing }
XPathASTFollowingSiblingStepNode >> isFollowingSiblingStep [
	^ true
]

{ #category : #testing }
XPathASTFollowingSiblingStepNode >> isForwardAxisStep [
	^ true
]
