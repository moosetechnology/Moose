Class {
	#name : #DelphiFormFloatNode,
	#superclass : #DelphiFormLiteralNode,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormFloatNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFloat: self
]
