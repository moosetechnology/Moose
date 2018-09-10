Class {
	#name : #JSForStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'forToken',
		'left',
		'initialExpression',
		'semicolons',
		'condition',
		'iteratorExpression',
		'right',
		'statement',
		'varToken',
		'variables',
		'commas',
		'declaration'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSForStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForStatement: self
]

{ #category : #generated }
JSForStatementNode >> commas [
	^ commas
]

{ #category : #generated }
JSForStatementNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSForStatementNode >> compositeNodeVariables [
	^ #(#variables)
]

{ #category : #generated }
JSForStatementNode >> condition [
	^ condition
]

{ #category : #generated }
JSForStatementNode >> condition: aJSExpressionNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aJSExpressionNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
JSForStatementNode >> declaration [
	^ declaration
]

{ #category : #generated }
JSForStatementNode >> declaration: aJSLexicalDeclarationNode [
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aJSLexicalDeclarationNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]
]

{ #category : #generated }
JSForStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
JSForStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
JSForStatementNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons #commas)
]

{ #category : #generated }
JSForStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSForStatementNode >> initialExpression [
	^ initialExpression
]

{ #category : #generated }
JSForStatementNode >> initialExpression: aJSExpressionNode [
	self initialExpression notNil
		ifTrue: [ self initialExpression parent: nil ].
	initialExpression := aJSExpressionNode.
	self initialExpression notNil
		ifTrue: [ self initialExpression parent: self ]
]

{ #category : #'generated-initialize-release' }
JSForStatementNode >> initialize [
	super initialize.
	semicolons := OrderedCollection new: 2.
	variables := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSForStatementNode >> iteratorExpression [
	^ iteratorExpression
]

{ #category : #generated }
JSForStatementNode >> iteratorExpression: aJSExpressionNode [
	self iteratorExpression notNil
		ifTrue: [ self iteratorExpression parent: nil ].
	iteratorExpression := aJSExpressionNode.
	self iteratorExpression notNil
		ifTrue: [ self iteratorExpression parent: self ]
]

{ #category : #generated }
JSForStatementNode >> left [
	^ left
]

{ #category : #generated }
JSForStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSForStatementNode >> nodeVariables [
	^ #(#initialExpression #condition #iteratorExpression #statement #declaration)
]

{ #category : #generated }
JSForStatementNode >> right [
	^ right
]

{ #category : #generated }
JSForStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSForStatementNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
JSForStatementNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
JSForStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSForStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSForStatementNode >> tokenVariables [
	^ #(#forToken #varToken)
]

{ #category : #generated }
JSForStatementNode >> varToken [
	^ varToken
]

{ #category : #generated }
JSForStatementNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
JSForStatementNode >> variables [
	^ variables
]

{ #category : #generated }
JSForStatementNode >> variables: anOrderedCollection [
	self setParents: self variables to: nil.
	variables := anOrderedCollection.
	self setParents: self variables to: self
]
