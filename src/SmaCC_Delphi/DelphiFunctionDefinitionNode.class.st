Class {
	#name : #DelphiFunctionDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFunctionDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunctionDefinition: self
]
