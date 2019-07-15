Class {
	#name : #JSConditionalExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'condition',
		'questionMarkToken',
		'trueExpression',
		'colonToken',
		'falseExpression'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSConditionalExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConditionalExpression: self
]

{ #category : #generated }
JSConditionalExpressionNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSConditionalExpressionNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSConditionalExpressionNode >> condition [
	^ condition
]

{ #category : #generated }
JSConditionalExpressionNode >> condition: aJSExpressionNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aJSExpressionNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
JSConditionalExpressionNode >> falseExpression [
	^ falseExpression
]

{ #category : #generated }
JSConditionalExpressionNode >> falseExpression: aJSExpressionNode [
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: nil ].
	falseExpression := aJSExpressionNode.
	self falseExpression notNil
		ifTrue: [ self falseExpression parent: self ]
]

{ #category : #generated }
JSConditionalExpressionNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #generated }
JSConditionalExpressionNode >> nodeVariables [
	^ #(#condition #trueExpression #falseExpression)
]

{ #category : #generated }
JSConditionalExpressionNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
JSConditionalExpressionNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
JSConditionalExpressionNode >> tokenVariables [
	^ #(#questionMarkToken)
]

{ #category : #generated }
JSConditionalExpressionNode >> trueExpression [
	^ trueExpression
]

{ #category : #generated }
JSConditionalExpressionNode >> trueExpression: aJSExpressionNode [
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: nil ].
	trueExpression := aJSExpressionNode.
	self trueExpression notNil
		ifTrue: [ self trueExpression parent: self ]
]
