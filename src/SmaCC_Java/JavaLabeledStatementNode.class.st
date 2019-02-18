Class {
	#name : #JavaLabeledStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'identifier',
		'colon',
		'statement'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaLabeledStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLabeledStatement: self
]

{ #category : #generated }
JavaLabeledStatementNode >> colon [
	^ colon
]

{ #category : #generated }
JavaLabeledStatementNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaLabeledStatementNode >> identifier [
	^ identifier
]

{ #category : #generated }
JavaLabeledStatementNode >> identifier: aSmaCCToken [
	identifier := aSmaCCToken
]

{ #category : #generated }
JavaLabeledStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
JavaLabeledStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JavaLabeledStatementNode >> statement: aJavaStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJavaStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JavaLabeledStatementNode >> tokenVariables [
	^ #(#identifier #colon)
]
