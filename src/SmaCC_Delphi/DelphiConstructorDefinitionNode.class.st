Class {
	#name : #DelphiConstructorDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstructorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstructorDefinition: self
]
