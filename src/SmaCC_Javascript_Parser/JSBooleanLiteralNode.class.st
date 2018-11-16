Class {
	#name : #JSBooleanLiteralNode,
	#superclass : #JSLiteralNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSBooleanLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanLiteral: self
]
