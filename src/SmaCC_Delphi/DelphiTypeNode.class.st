Class {
	#name : #DelphiTypeNode,
	#superclass : #DelphiProgramNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitType: self
]
