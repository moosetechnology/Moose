Class {
	#name : #JSFunctionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'functionToken',
		'name',
		'left',
		'restParameter',
		'parameters',
		'commas',
		'right',
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSFunctionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunction: self
]

{ #category : #generated }
JSFunctionNode >> commas [
	^ commas
]

{ #category : #generated }
JSFunctionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSFunctionNode >> compositeNodeVariables [
	^ #(#parameters #statements)
]

{ #category : #generated }
JSFunctionNode >> functionToken [
	^ functionToken
]

{ #category : #generated }
JSFunctionNode >> functionToken: aSmaCCToken [
	functionToken := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSFunctionNode >> ignoredTokenVariables [
	^ #(#left #right #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSFunctionNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSFunctionNode >> left [
	^ left
]

{ #category : #generated }
JSFunctionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSFunctionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> name [
	^ name
]

{ #category : #generated }
JSFunctionNode >> name: aJSNameExpressionNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSNameExpressionNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSFunctionNode >> nodeVariables [
	^ #(#name #restParameter)
]

{ #category : #generated }
JSFunctionNode >> parameters [
	^ parameters
]

{ #category : #generated }
JSFunctionNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
JSFunctionNode >> restParameter [
	^ restParameter
]

{ #category : #generated }
JSFunctionNode >> restParameter: aJSRestVariableDeclarationNode [
	self restParameter notNil
		ifTrue: [ self restParameter parent: nil ].
	restParameter := aJSRestVariableDeclarationNode.
	self restParameter notNil
		ifTrue: [ self restParameter parent: self ]
]

{ #category : #generated }
JSFunctionNode >> right [
	^ right
]

{ #category : #generated }
JSFunctionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSFunctionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> statements [
	^ statements
]

{ #category : #generated }
JSFunctionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSFunctionNode >> tokenVariables [
	^ #(#functionToken)
]
