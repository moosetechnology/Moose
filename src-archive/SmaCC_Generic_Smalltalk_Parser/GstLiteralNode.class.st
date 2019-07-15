Class {
	#name : #GstLiteralNode,
	#superclass : #GstValueNode,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteral: self
]
