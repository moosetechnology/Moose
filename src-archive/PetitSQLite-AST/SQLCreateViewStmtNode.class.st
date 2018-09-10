Class {
	#name : #SQLCreateViewStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'columns',
		'referenceTable',
		'ofTables'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #'as yet unclassified' }
SQLCreateViewStmtNode >> accept: aVisitor [
	^aVisitor visitCreateViewNode: self
]

{ #category : #'as yet unclassified' }
SQLCreateViewStmtNode >> ofTables [
	^ofTables
]

{ #category : #'as yet unclassified' }
SQLCreateViewStmtNode >> ofTables: aCollectionOfTables [
	ofTables := aCollectionOfTables
]
