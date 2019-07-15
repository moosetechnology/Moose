Class {
	#name : #JSStatementNode,
	#superclass : #JSProgramNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
