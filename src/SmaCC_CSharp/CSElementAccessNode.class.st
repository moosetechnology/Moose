Class {
	#name : #CSElementAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'baseExpression',
		'leftBracketToken',
		'expressions',
		'commaTokens',
		'rightBracketToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSElementAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElementAccess: self
]

{ #category : #generated }
CSElementAccessNode >> baseExpression [
	^ baseExpression
]

{ #category : #generated }
CSElementAccessNode >> baseExpression: aCSExpressionNode [
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: nil ].
	baseExpression := aCSExpressionNode.
	self baseExpression notNil
		ifTrue: [ self baseExpression parent: self ]
]

{ #category : #generated }
CSElementAccessNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSElementAccessNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSElementAccessNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
CSElementAccessNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSElementAccessNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSElementAccessNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSElementAccessNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSElementAccessNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSElementAccessNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSElementAccessNode >> nodeVariables [
	^ #(#baseExpression)
]

{ #category : #generated }
CSElementAccessNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSElementAccessNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSElementAccessNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken)
]
