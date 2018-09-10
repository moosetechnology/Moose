Class {
	#name : #SQLColumnDefNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'type',
		'constraints'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLColumnDefNode >> accept: aVisitor [
	^aVisitor visitColumnDefNode: self
]

{ #category : #accessing }
SQLColumnDefNode >> children [
	^Array with: self type with: self constraints
]

{ #category : #accessing }
SQLColumnDefNode >> constraints [
	^constraints
]

{ #category : #accessing }
SQLColumnDefNode >> constraints: anObject [
	constraints := anObject.
]

{ #category : #accessing }
SQLColumnDefNode >> type [
	^ type
]

{ #category : #accessing }
SQLColumnDefNode >> type: anObject [
	type := anObject
]
