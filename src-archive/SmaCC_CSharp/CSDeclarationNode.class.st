Class {
	#name : #CSDeclarationNode,
	#superclass : #CSProgramNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDeclaration: self
]
