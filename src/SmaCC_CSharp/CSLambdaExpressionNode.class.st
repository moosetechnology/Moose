Class {
	#name : #CSLambdaExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'signature',
		'equalGreaterThanToken',
		'body'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSLambdaExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLambdaExpression: self
]

{ #category : #generated }
CSLambdaExpressionNode >> body [
	^ body
]

{ #category : #generated }
CSLambdaExpressionNode >> body: aCSProgramNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aCSProgramNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
CSLambdaExpressionNode >> equalGreaterThanToken [
	^ equalGreaterThanToken
]

{ #category : #generated }
CSLambdaExpressionNode >> equalGreaterThanToken: aSmaCCToken [
	equalGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
CSLambdaExpressionNode >> nodeVariables [
	^ #(#signature #body)
]

{ #category : #generated }
CSLambdaExpressionNode >> signature [
	^ signature
]

{ #category : #generated }
CSLambdaExpressionNode >> signature: aCSProgramNode [
	self signature notNil
		ifTrue: [ self signature parent: nil ].
	signature := aCSProgramNode.
	self signature notNil
		ifTrue: [ self signature parent: self ]
]

{ #category : #generated }
CSLambdaExpressionNode >> tokenVariables [
	^ #(#equalGreaterThanToken)
]
