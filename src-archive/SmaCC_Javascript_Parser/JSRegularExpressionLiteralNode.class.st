Class {
	#name : #JSRegularExpressionLiteralNode,
	#superclass : #JSLiteralNode,
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSRegularExpressionLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRegularExpressionLiteral: self
]
