Class {
	#name : #CSTypeNode,
	#superclass : #CSProgramNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitType: self
]
