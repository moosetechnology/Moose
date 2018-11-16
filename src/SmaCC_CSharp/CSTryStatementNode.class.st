Class {
	#name : #CSTryStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'tryToken',
		'block',
		'clauses',
		'finally'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTryStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTryStatement: self
]

{ #category : #generated }
CSTryStatementNode >> block [
	^ block
]

{ #category : #generated }
CSTryStatementNode >> block: aCSBlockStatementNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aCSBlockStatementNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
CSTryStatementNode >> clauses [
	^ clauses
]

{ #category : #generated }
CSTryStatementNode >> clauses: anOrderedCollection [
	self setParents: self clauses to: nil.
	clauses := anOrderedCollection.
	self setParents: self clauses to: self
]

{ #category : #generated }
CSTryStatementNode >> compositeNodeVariables [
	^ #(#clauses)
]

{ #category : #generated }
CSTryStatementNode >> finally [
	^ finally
]

{ #category : #generated }
CSTryStatementNode >> finally: aCSFinallyClauseNode [
	self finally notNil
		ifTrue: [ self finally parent: nil ].
	finally := aCSFinallyClauseNode.
	self finally notNil
		ifTrue: [ self finally parent: self ]
]

{ #category : #'generated-initialize-release' }
CSTryStatementNode >> initialize [
	super initialize.
	clauses := OrderedCollection new: 2.
]

{ #category : #generated }
CSTryStatementNode >> nodeVariables [
	^ #(#block #finally)
]

{ #category : #generated }
CSTryStatementNode >> tokenVariables [
	^ #(#tryToken)
]

{ #category : #generated }
CSTryStatementNode >> tryToken [
	^ tryToken
]

{ #category : #generated }
CSTryStatementNode >> tryToken: aSmaCCToken [
	tryToken := aSmaCCToken
]
