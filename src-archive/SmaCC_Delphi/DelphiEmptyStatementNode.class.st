Class {
	#name : #DelphiEmptyStatementNode,
	#superclass : #DelphiStatementNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiEmptyStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyStatement: self
]
