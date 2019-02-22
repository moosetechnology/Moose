Class {
	#name : #JavaIntegerLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaIntegerLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIntegerLiteral: self
]
