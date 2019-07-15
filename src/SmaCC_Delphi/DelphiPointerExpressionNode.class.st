Class {
	#name : #DelphiPointerExpressionNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'expression',
		'upArrow'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPointerExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPointerExpression: self
]

{ #category : #generated }
DelphiPointerExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
DelphiPointerExpressionNode >> expression: aDelphiExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aDelphiExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
DelphiPointerExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
DelphiPointerExpressionNode >> tokenVariables [
	^ #(#upArrow)
]

{ #category : #generated }
DelphiPointerExpressionNode >> upArrow [
	^ upArrow
]

{ #category : #generated }
DelphiPointerExpressionNode >> upArrow: aSmaCCToken [
	upArrow := aSmaCCToken
]
