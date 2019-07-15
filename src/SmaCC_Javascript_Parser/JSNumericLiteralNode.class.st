Class {
	#name : #JSNumericLiteralNode,
	#superclass : #JSLiteralNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNumericLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNumericLiteral: self
]
