Class {
	#name : #SQLSelectFromPartNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'tables'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLSelectFromPartNode >> addTable: aTuple [
	"aTuple have the following form Array(tableName alias)"
	tables add: aTuple.
]

{ #category : #accessing }
SQLSelectFromPartNode >> initialize [
	tables := OrderedCollection new.
]

{ #category : #accessing }
SQLSelectFromPartNode >> tables [
	^tables
]
