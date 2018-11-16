Class {
	#name : #CSForStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'forToken',
		'leftParenToken',
		'initializer',
		'semicolonTokens',
		'condition',
		'iterator',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSForStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForStatement: self
]

{ #category : #generated }
CSForStatementNode >> condition [
	^ condition
]

{ #category : #generated }
CSForStatementNode >> condition: aCSExpressionNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aCSExpressionNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
CSForStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
CSForStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
CSForStatementNode >> ignoredCompositeTokenVariables [
	^ #(#semicolonTokens)
]

{ #category : #'generated-initialize-release' }
CSForStatementNode >> initialize [
	super initialize.
	semicolonTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSForStatementNode >> initializer [
	^ initializer
]

{ #category : #generated }
CSForStatementNode >> initializer: aCSProgramNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCSProgramNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CSForStatementNode >> iterator [
	^ iterator
]

{ #category : #generated }
CSForStatementNode >> iterator: aCSStatementListNode [
	self iterator notNil
		ifTrue: [ self iterator parent: nil ].
	iterator := aCSStatementListNode.
	self iterator notNil
		ifTrue: [ self iterator parent: self ]
]

{ #category : #generated }
CSForStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSForStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSForStatementNode >> nodeVariables [
	^ #(#initializer #condition #iterator #statement)
]

{ #category : #generated }
CSForStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSForStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSForStatementNode >> semicolonTokens [
	^ semicolonTokens
]

{ #category : #generated }
CSForStatementNode >> semicolonTokens: anOrderedCollection [
	semicolonTokens := anOrderedCollection
]

{ #category : #generated }
CSForStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSForStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSForStatementNode >> tokenVariables [
	^ #(#forToken #leftParenToken #rightParenToken)
]
