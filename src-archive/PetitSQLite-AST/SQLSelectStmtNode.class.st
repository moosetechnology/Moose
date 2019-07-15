Class {
	#name : #SQLSelectStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'columns',
		'from',
		'where'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLSelectStmtNode >> accept: aVisitor [
	^aVisitor visitSelectStmtNode: self
]

{ #category : #accessing }
SQLSelectStmtNode >> addColumn: aColumnName [
	columns add: aColumnName
]

{ #category : #accessing }
SQLSelectStmtNode >> addFrom: anObject [
	from add: anObject.
]

{ #category : #accessing }
SQLSelectStmtNode >> columns [
	^ columns
]

{ #category : #accessing }
SQLSelectStmtNode >> columns: anObject [
	columns := anObject
]

{ #category : #accessing }
SQLSelectStmtNode >> from [
	^ from
]

{ #category : #accessing }
SQLSelectStmtNode >> from: aCollections [
	from := aCollections 
]

{ #category : #accessing }
SQLSelectStmtNode >> initialize [
	columns := OrderedCollection new.
	from := OrderedCollection new.
	where := nil.
]

{ #category : #accessing }
SQLSelectStmtNode >> where [
	^ where
]

{ #category : #accessing }
SQLSelectStmtNode >> where: anObject [
	where := anObject
]
