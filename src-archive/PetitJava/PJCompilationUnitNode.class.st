Class {
	#name : #PJCompilationUnitNode,
	#superclass : #PJASTNode,
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJCompilationUnitNode >> acceptVisitor: aVisitor [

	aVisitor visitCompilationUnitNode: self
]
