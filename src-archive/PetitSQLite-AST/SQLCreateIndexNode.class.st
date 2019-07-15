Class {
	#name : #SQLCreateIndexNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'isUnique',
		'indexName',
		'referenceTable',
		'indexedColumnNames'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLCreateIndexNode >> accept: aVisitor [
	^aVisitor visitCreateIndexNode: self
]

{ #category : #accessing }
SQLCreateIndexNode >> addIndexedColumnName: aString [
	indexedColumnNames add: aString.
]

{ #category : #accessing }
SQLCreateIndexNode >> indexName [
	^ indexName
]

{ #category : #accessing }
SQLCreateIndexNode >> indexName: anObject [
	indexName := anObject
]

{ #category : #accessing }
SQLCreateIndexNode >> indexedColumnNames [
	^ indexedColumnNames
]

{ #category : #accessing }
SQLCreateIndexNode >> indexedColumnNames: anObject [
	indexedColumnNames := anObject
]

{ #category : #accessing }
SQLCreateIndexNode >> initialize [
	super initialize.
	indexedColumnNames := OrderedCollection new.
	isUnique := false.
]

{ #category : #accessing }
SQLCreateIndexNode >> isUnique [
	^ isUnique
]

{ #category : #accessing }
SQLCreateIndexNode >> isUnique: anObject [
	isUnique := anObject
]

{ #category : #accessing }
SQLCreateIndexNode >> referenceTable [
	^ referenceTable
]

{ #category : #accessing }
SQLCreateIndexNode >> referenceTable: anObject [
	referenceTable := anObject
]
