Class {
	#name : #CSConditionalExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'booleanExpression',
		'questionMarkToken',
		'trueExpression',
		'colonToken',
		'falseExpression'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSConditionalExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConditionalExpression: self
]

{ #category : #generated }
CSConditionalExpressionNode >> booleanExpression [
	^ booleanExpression
]

{ #category : #generated }
CSConditionalExpressionNode >> booleanExpression: aCSExpressionNode [
	self booleanExpression notNil
		ifTrue: [ self booleanExpression parent: nil ].
	booleanExpression := aCSExpressionNode.
	self booleanExpression notNil
		ifTrue: [ self booleanExpression parent: self ]
]

{ #category : #generated }
CSConditionalExpressionNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSConditionalExpressionNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSConditionalExpressionNode >> falseExpression [
	^ falseExpression
]

{ #category : #generated }
CSConditionalExpressionNode >> falseExpression: aCSExpressionNode [
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: nil ].
	falseExpression := aCSExpressionNode.
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: self ]
]

{ #category : #generated }
CSConditionalExpressionNode >> nodeVariables [
	^ #(#booleanExpression #trueExpression #falseExpression)
]

{ #category : #generated }
CSConditionalExpressionNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
CSConditionalExpressionNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
CSConditionalExpressionNode >> tokenVariables [
	^ #(#questionMarkToken #colonToken)
]

{ #category : #generated }
CSConditionalExpressionNode >> trueExpression [
	^ trueExpression
]

{ #category : #generated }
CSConditionalExpressionNode >> trueExpression: aCSExpressionNode [
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aCSExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]
]
