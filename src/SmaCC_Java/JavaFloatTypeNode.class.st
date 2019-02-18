Class {
	#name : #JavaFloatTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaFloatTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFloatType: self
]
