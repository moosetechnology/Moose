Class {
	#name : #JavaProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
