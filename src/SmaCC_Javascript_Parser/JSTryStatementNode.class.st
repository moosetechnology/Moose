Class {
	#name : #JSTryStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'tryToken',
		'tryBlock',
		'catchToken',
		'left',
		'exceptionType',
		'right',
		'catchBlock',
		'finallyToken',
		'finallyBlock'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSTryStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTryStatement: self
]

{ #category : #generated }
JSTryStatementNode >> catchBlock [
	^ catchBlock
]

{ #category : #generated }
JSTryStatementNode >> catchBlock: aJSBlockStatementNode [
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: nil ].
	catchBlock := aJSBlockStatementNode.
	self catchBlock notNil
		ifTrue: [ self catchBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> catchToken [
	^ catchToken
]

{ #category : #generated }
JSTryStatementNode >> catchToken: aSmaCCToken [
	catchToken := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> exceptionType [
	^ exceptionType
]

{ #category : #generated }
JSTryStatementNode >> exceptionType: aJSProgramNode [
	self exceptionType notNil
		ifTrue: [ self exceptionType parent: nil ].
	exceptionType := aJSProgramNode.
	self exceptionType notNil
		ifTrue: [ self exceptionType parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> finallyBlock [
	^ finallyBlock
]

{ #category : #generated }
JSTryStatementNode >> finallyBlock: aJSBlockStatementNode [
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: nil ].
	finallyBlock := aJSBlockStatementNode.
	self finallyBlock notNil
		ifTrue: [ self finallyBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> finallyToken [
	^ finallyToken
]

{ #category : #generated }
JSTryStatementNode >> finallyToken: aSmaCCToken [
	finallyToken := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> ignoredTokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
JSTryStatementNode >> left [
	^ left
]

{ #category : #generated }
JSTryStatementNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> nodeVariables [
	^ #(#tryBlock #exceptionType #catchBlock #finallyBlock)
]

{ #category : #generated }
JSTryStatementNode >> right [
	^ right
]

{ #category : #generated }
JSTryStatementNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSTryStatementNode >> tokenVariables [
	^ #(#tryToken #catchToken #finallyToken)
]

{ #category : #generated }
JSTryStatementNode >> tryBlock [
	^ tryBlock
]

{ #category : #generated }
JSTryStatementNode >> tryBlock: aJSBlockStatementNode [
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: nil ].
	tryBlock := aJSBlockStatementNode.
	self tryBlock notNil
		ifTrue: [ self tryBlock parent: self ]
]

{ #category : #generated }
JSTryStatementNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
JSTryStatementNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]
