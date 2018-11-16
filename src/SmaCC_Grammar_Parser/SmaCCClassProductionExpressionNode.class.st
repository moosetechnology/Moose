Class {
	#name : #SmaCCClassProductionExpressionNode,
	#superclass : #SmaCCProductionExpressionNode,
	#instVars : [
		'left',
		'classname',
		'right'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCClassProductionExpressionNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitClassProductionExpression: self
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> classname [
	^ classname
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> classname: aSmaCCToken [
	classname := aSmaCCToken
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> left [
	^ left
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> right [
	^ right
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
SmaCCClassProductionExpressionNode >> tokenVariables [
	^ #(#left #classname #right)
]
