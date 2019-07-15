Class {
	#name : #CSStringLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSStringLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStringLiteralExpression: self
]
