Class {
	#name : #SwiftWhileStatementNode,
	#superclass : #SwiftLoopStatementNode,
	#instVars : [
		'whileToken',
		'expression',
		'block'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftWhileStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitWhileStatement: self
]

{ #category : #generated }
SwiftWhileStatementNode >> block [
	^ block
]

{ #category : #generated }
SwiftWhileStatementNode >> block: aSwiftBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aSwiftBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
SwiftWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
SwiftWhileStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #generated }
SwiftWhileStatementNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
SwiftWhileStatementNode >> otherVariables [
	^ #(#expression)
]

{ #category : #generated }
SwiftWhileStatementNode >> tokenVariables [
	^ #(#whileToken #semicolonToken)
]

{ #category : #generated }
SwiftWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
SwiftWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
