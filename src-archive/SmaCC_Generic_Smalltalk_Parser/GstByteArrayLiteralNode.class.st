Class {
	#name : #GstByteArrayLiteralNode,
	#superclass : #GstArrayLiteralNode,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstByteArrayLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitByteArrayLiteral: self
]
