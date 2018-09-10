Class {
	#name : #CSBaseAccessNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'baseToken',
		'periodToken',
		'identifier',
		'leftBracketToken',
		'expressions',
		'commaTokens',
		'rightBracketToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSBaseAccessNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBaseAccess: self
]

{ #category : #generated }
CSBaseAccessNode >> baseToken [
	^ baseToken
]

{ #category : #generated }
CSBaseAccessNode >> baseToken: aSmaCCToken [
	baseToken := aSmaCCToken
]

{ #category : #generated }
CSBaseAccessNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSBaseAccessNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSBaseAccessNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
CSBaseAccessNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSBaseAccessNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSBaseAccessNode >> identifier [
	^ identifier
]

{ #category : #generated }
CSBaseAccessNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
CSBaseAccessNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSBaseAccessNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSBaseAccessNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSBaseAccessNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSBaseAccessNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSBaseAccessNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSBaseAccessNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSBaseAccessNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSBaseAccessNode >> tokenVariables [
	^ #(#baseToken #periodToken #identifier #leftBracketToken #rightBracketToken)
]
