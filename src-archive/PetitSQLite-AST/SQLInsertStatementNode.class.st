Class {
	#name : #SQLInsertStatementNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'affectedColumns',
		'values',
		'table'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLInsertStatementNode >> addAffectedColumn: anObject [
	affectedColumns add: anObject
]

{ #category : #accessing }
SQLInsertStatementNode >> addValue: anObject [
	values := anObject
]

{ #category : #accessing }
SQLInsertStatementNode >> affectedColumns [
	^ affectedColumns
]

{ #category : #accessing }
SQLInsertStatementNode >> affectedColumns: aCollection [
	affectedColumns := aCollection
]

{ #category : #accessing }
SQLInsertStatementNode >> from [ 
	^ {self table}
]

{ #category : #accessing }
SQLInsertStatementNode >> initialize [
	super initialize.
	
	affectedColumns := OrderedCollection new.
	values := OrderedCollection new.
	table := nil.
]

{ #category : #accessing }
SQLInsertStatementNode >> table [
	^ table
]

{ #category : #accessing }
SQLInsertStatementNode >> table: anObject [
	table := anObject
]

{ #category : #accessing }
SQLInsertStatementNode >> values [
	^ values
]

{ #category : #accessing }
SQLInsertStatementNode >> values: aCollection [
	values := aCollection
]
