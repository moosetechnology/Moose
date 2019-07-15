Class {
	#name : #SQLCreateTableStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'columns',
		'constraints'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #'as yet unclassified' }
SQLCreateTableStmtNode >> accept: aVisitor [
	^aVisitor visitCreateTableNode: self
]

{ #category : #accessing }
SQLCreateTableStmtNode >> children [
	^Array with: (OrderedCollection withAll: self columns) with: (OrderedCollection withAll: self constraints).
]

{ #category : #accessing }
SQLCreateTableStmtNode >> columns [
	^ columns
]

{ #category : #accessing }
SQLCreateTableStmtNode >> columns: anObject [
	columns := anObject
]

{ #category : #accessing }
SQLCreateTableStmtNode >> constraints [
	^ constraints
]

{ #category : #accessing }
SQLCreateTableStmtNode >> constraints: anObject [
	constraints := anObject
]

{ #category : #accessing }
SQLCreateTableStmtNode >> initialize [
]
