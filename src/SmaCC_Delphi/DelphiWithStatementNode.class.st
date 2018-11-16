Class {
	#name : #DelphiWithStatementNode,
	#superclass : #DelphiStatementNode,
	#instVars : [
		'withToken',
		'expressions',
		'commas',
		'doToken',
		'statement'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiWithStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWithStatement: self
]

{ #category : #generated }
DelphiWithStatementNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiWithStatementNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiWithStatementNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
DelphiWithStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
DelphiWithStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
DelphiWithStatementNode >> expressions [
	^ expressions
]

{ #category : #generated }
DelphiWithStatementNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #generated }
DelphiWithStatementNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiWithStatementNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiWithStatementNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
DelphiWithStatementNode >> statement [
	^ statement
]

{ #category : #generated }
DelphiWithStatementNode >> statement: aDelphiStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aDelphiStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
DelphiWithStatementNode >> tokenVariables [
	^ #(#withToken #doToken)
]

{ #category : #generated }
DelphiWithStatementNode >> withToken [
	^ withToken
]

{ #category : #generated }
DelphiWithStatementNode >> withToken: aSmaCCToken [
	withToken := aSmaCCToken
]
