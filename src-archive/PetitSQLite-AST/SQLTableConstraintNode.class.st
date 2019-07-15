Class {
	#name : #SQLTableConstraintNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'isPKConstraint',
		'isFKConstraint',
		'fkReferencedTableName',
		'fkColumns',
		'pkColumns',
		'isUnique',
		'uniqueColumns',
		'isCheckConstraint',
		'expressionString'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLTableConstraintNode >> accept: aVisitor [
	^aVisitor visitTableConstraintNode: self
]

{ #category : #accessing }
SQLTableConstraintNode >> addFKColumnName: aString [
	fkColumns addLast: aString.
]

{ #category : #accessing }
SQLTableConstraintNode >> addPKColumnName: aString [
	pkColumns addLast: aString.
]

{ #category : #accessing }
SQLTableConstraintNode >> addUniqueColumnName: aString [
	uniqueColumns addLast: aString.
]

{ #category : #accessing }
SQLTableConstraintNode >> expressionString [
	^expressionString
]

{ #category : #accessing }
SQLTableConstraintNode >> expressionString: aString [
	expressionString := aString.
]

{ #category : #accessing }
SQLTableConstraintNode >> fkColumnNames [
	^fkColumns
]

{ #category : #initialization }
SQLTableConstraintNode >> initialize [
	name := nil.
	isPKConstraint := false.
	isFKConstraint := false.
	isUnique := false.
	isCheckConstraint := false.
	fkColumns := OrderedCollection new.
	pkColumns := OrderedCollection new.
	uniqueColumns := OrderedCollection new.
	fkReferencedTableName := nil.
]

{ #category : #accessing }
SQLTableConstraintNode >> isCheck [ 
	^isCheckConstraint
]

{ #category : #accessing }
SQLTableConstraintNode >> isCheck: aBoolean [
	isCheckConstraint := aBoolean.
]

{ #category : #accessing }
SQLTableConstraintNode >> isFKConstraint [
	^isFKConstraint
	
]

{ #category : #accessing }
SQLTableConstraintNode >> isFKConstraint: aBoolean [
	isFKConstraint := aBoolean
	
]

{ #category : #accessing }
SQLTableConstraintNode >> isPKConstraint [
	^isPKConstraint
	
]

{ #category : #accessing }
SQLTableConstraintNode >> isPKConstraint: aBoolean [
	isPKConstraint := aBoolean
	
]

{ #category : #accessing }
SQLTableConstraintNode >> isUnique [
	^isUnique
]

{ #category : #accessing }
SQLTableConstraintNode >> isUnique: aBoolean [
	isUnique := aBoolean. 
]

{ #category : #accessing }
SQLTableConstraintNode >> pkColumnNames [
	^pkColumns
]

{ #category : #accessing }
SQLTableConstraintNode >> referencedTableName [
	^fkReferencedTableName
]

{ #category : #accessing }
SQLTableConstraintNode >> referencedTableName: aString [
	fkReferencedTableName := aString.
]

{ #category : #accessing }
SQLTableConstraintNode >> uniqueColumnNames [
	^uniqueColumns
]
