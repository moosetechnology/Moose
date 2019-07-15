Class {
	#name : #DelphiFormStringNode,
	#superclass : #DelphiFormLiteralNode,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormStringNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitString: self
]
