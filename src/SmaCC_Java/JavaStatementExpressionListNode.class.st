Class {
	#name : #JavaStatementExpressionListNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'expressions',
		'commas'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaStatementExpressionListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatementExpressionList: self
]

{ #category : #generated }
JavaStatementExpressionListNode >> commas [
	^ commas
]

{ #category : #generated }
JavaStatementExpressionListNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JavaStatementExpressionListNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
JavaStatementExpressionListNode >> expressions [
	^ expressions
]

{ #category : #generated }
JavaStatementExpressionListNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
JavaStatementExpressionListNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
JavaStatementExpressionListNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]
