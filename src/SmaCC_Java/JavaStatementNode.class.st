Class {
	#name : #JavaStatementNode,
	#superclass : #JavaProgramNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
