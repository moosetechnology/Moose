Class {
	#name : #JSForInStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'forToken',
		'left',
		'variable',
		'inToken',
		'expression',
		'right',
		'statement',
		'varToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSForInStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForInStatement: self
]

{ #category : #generated }
JSForInStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSForInStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSForInStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
JSForInStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
JSForInStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSForInStatementNode >> inToken [
	^ inToken
]

{ #category : #generated }
JSForInStatementNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
JSForInStatementNode >> left [
	^ left
]

{ #category : #generated }
JSForInStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSForInStatementNode >> nodeVariables [
	^ #(#variable #expression #statement)
]

{ #category : #generated }
JSForInStatementNode >> right [
	^ right
]

{ #category : #generated }
JSForInStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSForInStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSForInStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSForInStatementNode >> tokenVariables [
	^ #(#forToken #inToken #varToken)
]

{ #category : #generated }
JSForInStatementNode >> varToken [
	^ varToken
]

{ #category : #generated }
JSForInStatementNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
JSForInStatementNode >> variable [
	^ variable
]

{ #category : #generated }
JSForInStatementNode >> variable: aJSProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJSProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
