Class {
	#name : #DelphiClassFunctionDefinitionNode,
	#superclass : #DelphiFunctionDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassFunctionDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassFunctionDefinition: self
]
