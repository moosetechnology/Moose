Class {
	#name : #JSProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
