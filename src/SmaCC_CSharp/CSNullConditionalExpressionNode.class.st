Class {
	#name : #CSNullConditionalExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'expression',
		'nullConditionalOperation'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullConditionalExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullConditionalExpression: self
]

{ #category : #generated }
CSNullConditionalExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CSNullConditionalExpressionNode >> expression: aCSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CSNullConditionalExpressionNode >> nodeVariables [
	^ #(#expression #nullConditionalOperation)
]

{ #category : #generated }
CSNullConditionalExpressionNode >> nullConditionalOperation [
	^ nullConditionalOperation
]

{ #category : #generated }
CSNullConditionalExpressionNode >> nullConditionalOperation: aCSExpressionNode [
	self nullConditionalOperation notNil
		ifTrue: [ self nullConditionalOperation parent: nil ].
	nullConditionalOperation := aCSExpressionNode.
	self nullConditionalOperation notNil
		ifTrue: [ self nullConditionalOperation parent: self ]
]
