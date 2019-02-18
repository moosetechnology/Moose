Class {
	#name : #JavaCharTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaCharTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCharType: self
]
