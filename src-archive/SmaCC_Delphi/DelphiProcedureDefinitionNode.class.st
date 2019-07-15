Class {
	#name : #DelphiProcedureDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProcedureDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProcedureDefinition: self
]
