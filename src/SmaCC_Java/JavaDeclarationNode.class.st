Class {
	#name : #JavaDeclarationNode,
	#superclass : #JavaProgramNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDeclaration: self
]
