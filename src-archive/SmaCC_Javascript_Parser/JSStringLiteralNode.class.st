Class {
	#name : #JSStringLiteralNode,
	#superclass : #JSLiteralNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSStringLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteral: self
]
