Class {
	#name : #DelphiFormParseNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
