Class {
	#name : #JavaLongTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLongTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLongType: self
]
