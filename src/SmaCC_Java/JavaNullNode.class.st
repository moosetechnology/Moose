Class {
	#name : #JavaNullNode,
	#superclass : #JavaLiteralNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaNullNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNull: self
]
