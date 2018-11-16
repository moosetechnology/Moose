Class {
	#name : #SmaCCCodeProductionExpressionNode,
	#superclass : #SmaCCProductionExpressionNode,
	#instVars : [
		'code'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCCodeProductionExpressionNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitCodeProductionExpression: self
]

{ #category : #generated }
SmaCCCodeProductionExpressionNode >> code [
	^ code
]

{ #category : #generated }
SmaCCCodeProductionExpressionNode >> code: aSmaCCToken [
	code := aSmaCCToken
]

{ #category : #generated }
SmaCCCodeProductionExpressionNode >> tokenVariables [
	^ #(#code)
]
