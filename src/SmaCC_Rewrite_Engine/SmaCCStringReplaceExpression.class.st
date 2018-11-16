Class {
	#name : #SmaCCStringReplaceExpression,
	#superclass : #SmaCCReplaceExpression,
	#instVars : [
		'string'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #generated }
SmaCCStringReplaceExpression >> acceptVisitor: aReplaceVisitor [
	^ aReplaceVisitor visitStringReplace: self
]

{ #category : #evaluating }
SmaCCStringReplaceExpression >> evaluateInContext: aSmaCCRewriteMatchContext [
	^ string value
]

{ #category : #generated }
SmaCCStringReplaceExpression >> string [
	^ string
]

{ #category : #generated }
SmaCCStringReplaceExpression >> string: aSmaCCToken [
	string := aSmaCCToken
]

{ #category : #generated }
SmaCCStringReplaceExpression >> tokenVariables [
	^ #(#string)
]
