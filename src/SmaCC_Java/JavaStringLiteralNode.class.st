Class {
	#name : #JavaStringLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaStringLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteral: self
]
