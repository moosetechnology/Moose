Class {
	#name : #CSRealLiteralExpressionNode,
	#superclass : #CSLiteralExpressionNode,
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSRealLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRealLiteralExpression: self
]
