Class {
	#name : #SmaCCRewriteTestExpressionNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitExpression: aBinaryExpression
]

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitExpression: anExpression [
	^ self visitSmaCCParseNode: anExpression
]

{ #category : #generated }
SmaCCRewriteTestExpressionNodeVisitor >> visitNumber: aNumber [
	^ self visitExpression: aNumber
]
