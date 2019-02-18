Class {
	#name : #JavaShortTypeNode,
	#superclass : #JavaPrimitiveTypeNode,
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaShortTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitShortType: self
]
