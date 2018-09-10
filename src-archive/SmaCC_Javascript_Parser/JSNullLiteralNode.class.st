Class {
	#name : #JSNullLiteralNode,
	#superclass : #JSLiteralNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSNullLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullLiteral: self
]
