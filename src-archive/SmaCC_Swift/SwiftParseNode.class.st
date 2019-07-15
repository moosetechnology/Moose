Class {
	#name : #SwiftParseNode,
	#superclass : #SmaCCParseNode,
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftParseNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitParse: self
]
