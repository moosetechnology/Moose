Class {
	#name : #CSIntegerLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSIntegerLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIntegerLiteralExpression: self
]
