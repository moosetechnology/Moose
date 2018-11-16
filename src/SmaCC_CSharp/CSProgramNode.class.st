Class {
	#name : #CSProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
