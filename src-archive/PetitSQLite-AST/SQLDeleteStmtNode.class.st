Class {
	#name : #SQLDeleteStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'from',
		'where'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLDeleteStmtNode >> addFrom: aTable [
	from addLast: aTable
]

{ #category : #accessing }
SQLDeleteStmtNode >> addWhere: aCollectionRepresentingAnSQLExpression [
	where addLast: aCollectionRepresentingAnSQLExpression
]

{ #category : #accessing }
SQLDeleteStmtNode >> from [
	^ from
]

{ #category : #accessing }
SQLDeleteStmtNode >> initialize [
	super initialize.
	from := OrderedCollection new.
	where := OrderedCollection new.
]

{ #category : #accessing }
SQLDeleteStmtNode >> where [
	^ where
]

{ #category : #accessing }
SQLDeleteStmtNode >> where: anObject [
	where := anObject
]
