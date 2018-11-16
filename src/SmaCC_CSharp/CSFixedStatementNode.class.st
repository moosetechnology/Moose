Class {
	#name : #CSFixedStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'fixedToken',
		'leftParenToken',
		'type',
		'declarators',
		'commaTokens',
		'rightParenToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSFixedStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFixedStatement: self
]

{ #category : #generated }
CSFixedStatementNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSFixedStatementNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSFixedStatementNode >> compositeNodeVariables [
	^ #(#declarators)
]

{ #category : #generated }
CSFixedStatementNode >> declarators [
	^ declarators
]

{ #category : #generated }
CSFixedStatementNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #generated }
CSFixedStatementNode >> fixedToken [
	^ fixedToken
]

{ #category : #generated }
CSFixedStatementNode >> fixedToken: aSmaCCToken [
	fixedToken := aSmaCCToken
]

{ #category : #generated }
CSFixedStatementNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSFixedStatementNode >> initialize [
	super initialize.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSFixedStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CSFixedStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CSFixedStatementNode >> nodeVariables [
	^ #(#type #statement)
]

{ #category : #generated }
CSFixedStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CSFixedStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CSFixedStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSFixedStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSFixedStatementNode >> tokenVariables [
	^ #(#fixedToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CSFixedStatementNode >> type [
	^ type
]

{ #category : #generated }
CSFixedStatementNode >> type: aCSPointerTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSPointerTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
