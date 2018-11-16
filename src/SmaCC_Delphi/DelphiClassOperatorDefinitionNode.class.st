Class {
	#name : #DelphiClassOperatorDefinitionNode,
	#superclass : #DelphiFunctionDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassOperatorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassOperatorDefinition: self
]
