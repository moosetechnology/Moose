Class {
	#name : #JavaLambdaExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'leftParen',
		'parameters',
		'commas',
		'rightParen',
		'arrowToken',
		'value'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLambdaExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLambdaExpression: self
]

{ #category : #generated }
JavaLambdaExpressionNode >> arrowToken [
	^ arrowToken
]

{ #category : #generated }
JavaLambdaExpressionNode >> arrowToken: aSmaCCToken [
	arrowToken := aSmaCCToken
]

{ #category : #generated }
JavaLambdaExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JavaLambdaExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaLambdaExpressionNode >> compositeNodeVariables [
	^ #(#parameters)
]

{ #category : #generated }
JavaLambdaExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #_leftParens #_rightParens)
]

{ #category : #generated }
JavaLambdaExpressionNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #'generated-initialize-release' }
JavaLambdaExpressionNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JavaLambdaExpressionNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaLambdaExpressionNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaLambdaExpressionNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
JavaLambdaExpressionNode >> parameters [
	^ parameters
]

{ #category : #generated }
JavaLambdaExpressionNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
JavaLambdaExpressionNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaLambdaExpressionNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaLambdaExpressionNode >> tokenVariables [
	^ #(#arrowToken)
]

{ #category : #generated }
JavaLambdaExpressionNode >> value [
	^ value
]

{ #category : #generated }
JavaLambdaExpressionNode >> value: aJavaProgramNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJavaProgramNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
