Class {
	#name : #DelphiClassProcedureDefinitionNode,
	#superclass : #DelphiProcedureDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassProcedureDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassProcedureDefinition: self
]
