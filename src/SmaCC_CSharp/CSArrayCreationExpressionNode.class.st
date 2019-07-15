Class {
	#name : #CSArrayCreationExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'newToken',
		'type',
		'leftBracketToken',
		'expressions',
		'commaTokens',
		'rightBracketToken',
		'rankSpecifiers',
		'arrayInitializer'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSArrayCreationExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayCreationExpression: self
]

{ #category : #generated }
CSArrayCreationExpressionNode >> arrayInitializer [
	^ arrayInitializer
]

{ #category : #generated }
CSArrayCreationExpressionNode >> arrayInitializer: aCSArrayInitializerNode [
	self arrayInitializer notNil
		ifTrue: [ self arrayInitializer parent: nil ].
	arrayInitializer := aCSArrayInitializerNode.
	self arrayInitializer notNil
		ifTrue: [ self arrayInitializer parent: self ]
]

{ #category : #generated }
CSArrayCreationExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSArrayCreationExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSArrayCreationExpressionNode >> compositeNodeVariables [
	^ #(#expressions #rankSpecifiers)
]

{ #category : #generated }
CSArrayCreationExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSArrayCreationExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSArrayCreationExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens #_leftParens #_rightParens)
]

{ #category : #'generated-initialize-release' }
CSArrayCreationExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	rankSpecifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CSArrayCreationExpressionNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> nodeVariables [
	^ #(#type #arrayInitializer)
]

{ #category : #generated }
CSArrayCreationExpressionNode >> rankSpecifiers [
	^ rankSpecifiers
]

{ #category : #generated }
CSArrayCreationExpressionNode >> rankSpecifiers: anOrderedCollection [
	self setParents: self rankSpecifiers to: nil.
	rankSpecifiers := anOrderedCollection.
	self setParents: self rankSpecifiers to: self
]

{ #category : #generated }
CSArrayCreationExpressionNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
CSArrayCreationExpressionNode >> tokenVariables [
	^ #(#newToken #leftBracketToken #rightBracketToken)
]

{ #category : #generated }
CSArrayCreationExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSArrayCreationExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
