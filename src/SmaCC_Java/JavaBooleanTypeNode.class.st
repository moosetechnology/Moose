Class {
	#name : #JavaBooleanTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaBooleanTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanType: self
]
