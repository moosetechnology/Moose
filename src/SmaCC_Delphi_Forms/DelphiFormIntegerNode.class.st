Class {
	#name : #DelphiFormIntegerNode,
	#superclass : #DelphiFormLiteralNode,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormIntegerNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitInteger: self
]
