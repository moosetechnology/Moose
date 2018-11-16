Class {
	#name : #CSNullLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullLiteralExpression: self
]
