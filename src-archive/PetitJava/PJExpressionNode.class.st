"
Common superclass for all expression nodes e.i. nodes that have some kind of valuse: variables, literals, method invocations, etc.
"
Class {
	#name : #PJExpressionNode,
	#superclass : #PJASTNode,
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJExpressionNode >> acceptVisitor: aVisitor [

	aVisitor visitExpressionNode: self
]
