Class {
	#name : #CSBooleanLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSBooleanLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBooleanLiteralExpression: self
]
