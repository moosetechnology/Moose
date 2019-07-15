Class {
	#name : #JavaFloatLiteralNode,
	#superclass : #JavaLiteralNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaFloatLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFloatLiteral: self
]
