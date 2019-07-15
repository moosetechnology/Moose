Class {
	#name : #SQLASTAbstractVisitor,
	#superclass : #Object,
	#instVars : [
		'importer'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLASTAbstractVisitor >> importer [
	^ importer
]

{ #category : #accessing }
SQLASTAbstractVisitor >> importer: anObject [
	importer := anObject
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visit: anElement [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitAlterTableStatementNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitColumnConstraintNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitColumnDefNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitCreateIndexNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitCreateTableNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitSelectStmtNode: anElement [
	^ self visit: anElement
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitTableConstraintNode: anElement [
	^ self visit: anElement
]
