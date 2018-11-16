Class {
	#name : #DelphiStatementNode,
	#superclass : #DelphiProgramNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatement: self
]
