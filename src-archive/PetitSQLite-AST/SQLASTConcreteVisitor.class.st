Class {
	#name : #SQLASTConcreteVisitor,
	#superclass : #SQLASTAbstractVisitor,
	#category : #'PetitSQLite-AST'
}

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitAlterTableStatementNode: anElement [
	^self importer ensureAnAlterTableStmt: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitColumnConstraintNode: anElement [
	^self importer ensureAColumnConstraint: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitColumnDefNode: anElement [
	^self importer ensureAColumn: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitCreateIndexNode: anElement [
	^self importer ensureASQLIndex: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitCreateTableNode: anElement [
	^self importer ensureATable: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitCreateViewNode: anElement [
	^self importer ensureAView: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitSelectStmtNode: anElement [
	^self importer ensureSelectStmtNode: anElement.
]

{ #category : #'as yet unclassified' }
SQLASTConcreteVisitor >> visitTableConstraintNode: anElement [
	^self importer ensureTableConstraintNode: anElement.
]
