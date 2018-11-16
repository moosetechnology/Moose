Class {
	#name : #DelphiSetValueNode,
	#superclass : #DelphiProgramNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiSetValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSetValue: self
]
