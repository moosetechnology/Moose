Class {
	#name : #CSStatementListNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'expressions',
		'commaTokens'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSStatementListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStatementList: self
]

{ #category : #generated }
CSStatementListNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSStatementListNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSStatementListNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
CSStatementListNode >> expressions [
	^ expressions
]

{ #category : #generated }
CSStatementListNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
CSStatementListNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSStatementListNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]
