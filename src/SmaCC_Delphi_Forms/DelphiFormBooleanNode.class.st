Class {
	#name : #DelphiFormBooleanNode,
	#superclass : #DelphiFormLiteralNode,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormBooleanNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBoolean: self
]
