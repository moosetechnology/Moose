Class {
	#name : #DelphiProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
