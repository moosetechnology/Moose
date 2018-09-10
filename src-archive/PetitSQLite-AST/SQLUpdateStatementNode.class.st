Class {
	#name : #SQLUpdateStatementNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'table',
		'setValue',
		'where'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLUpdateStatementNode >> from [ 
	^ {table} 
]

{ #category : #accessing }
SQLUpdateStatementNode >> initialize [
	table := OrderedCollection new.
	setValue := nil.
	where := nil.
]

{ #category : #accessing }
SQLUpdateStatementNode >> setValue [
	^ setValue
]

{ #category : #accessing }
SQLUpdateStatementNode >> setValue: anObject [
	setValue := anObject
]

{ #category : #accessing }
SQLUpdateStatementNode >> table [
	^ table
]

{ #category : #accessing }
SQLUpdateStatementNode >> table: aStringOrATable [
	table := aStringOrATable
]

{ #category : #accessing }
SQLUpdateStatementNode >> where [
	^ where
]

{ #category : #accessing }
SQLUpdateStatementNode >> where: anObject [
	where := anObject
]
