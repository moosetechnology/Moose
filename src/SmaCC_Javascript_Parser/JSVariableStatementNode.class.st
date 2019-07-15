Class {
	#name : #JSVariableStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'varToken',
		'variables',
		'commas',
		'semicolon'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSVariableStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableStatement: self
]

{ #category : #generated }
JSVariableStatementNode >> commas [
	^ commas
]

{ #category : #generated }
JSVariableStatementNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSVariableStatementNode >> compositeNodeVariables [
	^ #(#variables)
]

{ #category : #generated }
JSVariableStatementNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSVariableStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #'generated-initialize-release' }
JSVariableStatementNode >> initialize [
	super initialize.
	variables := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSVariableStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSVariableStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSVariableStatementNode >> tokenVariables [
	^ #(#varToken)
]

{ #category : #generated }
JSVariableStatementNode >> varToken [
	^ varToken
]

{ #category : #generated }
JSVariableStatementNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
JSVariableStatementNode >> variables [
	^ variables
]

{ #category : #generated }
JSVariableStatementNode >> variables: anOrderedCollection [
	self setParents: self variables to: nil.
	variables := anOrderedCollection.
	self setParents: self variables to: self
]
