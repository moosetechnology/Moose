Class {
	#name : #JSIndexedPropertyExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expressions',
		'leftBracket',
		'fieldExpression',
		'rightBracket'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSIndexedPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIndexedPropertyExpression: self
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> fieldExpression [
	^ fieldExpression
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> fieldExpression: aJSExpressionNode [
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: nil ].
	fieldExpression := aJSExpressionNode.
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: self ]
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #'generated-initialize-release' }
JSIndexedPropertyExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> nodeVariables [
	^ #(#fieldExpression)
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
