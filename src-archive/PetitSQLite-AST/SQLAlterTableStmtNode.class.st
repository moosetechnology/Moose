Class {
	#name : #SQLAlterTableStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'isRename',
		'isAddColumn',
		'isAddConstraint',
		'nameOfTableToAlter',
		'newTableName',
		'constaints'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLAlterTableStmtNode >> accept: aVisitor [
	^aVisitor visitAlterTableStatementNode: self
]

{ #category : #accessing }
SQLAlterTableStmtNode >> addConstraint: aConstraintNode [
	constaints addLast: aConstraintNode.
]

{ #category : #accessing }
SQLAlterTableStmtNode >> constraints [
	^constaints
]

{ #category : #accessing }
SQLAlterTableStmtNode >> initialize [
	isAddColumn := false.
	isAddConstraint := false.
	isRename := false.
	constaints := OrderedCollection new.
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isAddColumn [
	^ isAddColumn
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isAddColumn: aBoolean [
	isAddColumn := aBoolean
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isAddConstraint [
	^ isAddConstraint
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isAddConstraint: aBoolean [
	isAddConstraint := aBoolean
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isRename [
	^ isRename
]

{ #category : #accessing }
SQLAlterTableStmtNode >> isRename: aBoolean [
	isRename := aBoolean
]

{ #category : #accessing }
SQLAlterTableStmtNode >> nameOfTableToAlter [
	^ nameOfTableToAlter
]

{ #category : #accessing }
SQLAlterTableStmtNode >> nameOfTableToAlter: anObject [
	nameOfTableToAlter := anObject
]

{ #category : #accessing }
SQLAlterTableStmtNode >> newTableName [
	"This methd return nil or a string in the case the alter table statment respond true to isRename"
	^ newTableName
]

{ #category : #accessing }
SQLAlterTableStmtNode >> newTableName: aString [
	newTableName := aString
]
