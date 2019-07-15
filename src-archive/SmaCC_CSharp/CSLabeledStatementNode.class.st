Class {
	#name : #CSLabeledStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'identifierToken',
		'colonToken',
		'statement'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSLabeledStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLabeledStatement: self
]

{ #category : #generated }
CSLabeledStatementNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CSLabeledStatementNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CSLabeledStatementNode >> identifierToken [
	^ identifierToken
]

{ #category : #generated }
CSLabeledStatementNode >> identifierToken: aSmaCCToken [
	identifierToken := aSmaCCToken
]

{ #category : #generated }
CSLabeledStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
CSLabeledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CSLabeledStatementNode >> statement: aCSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CSLabeledStatementNode >> tokenVariables [
	^ #(#identifierToken #colonToken)
]
