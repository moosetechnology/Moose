Class {
	#name : #DelphiDestructorDefinitionNode,
	#superclass : #DelphiMethodDefinitionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiDestructorDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDestructorDefinition: self
]
