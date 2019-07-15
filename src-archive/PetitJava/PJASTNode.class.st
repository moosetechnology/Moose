"
General node defining for Java AST
"
Class {
	#name : #PJASTNode,
	#superclass : #Object,
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJASTNode >> acceptVisitor: aVisitor [

	^self subclassResponsibility
]
