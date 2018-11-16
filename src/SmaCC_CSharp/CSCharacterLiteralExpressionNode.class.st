Class {
	#name : #CSCharacterLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSCharacterLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCharacterLiteralExpression: self
]
