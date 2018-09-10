Class {
	#name : #SQLColumnConstraintNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'defaultValue',
		'unique',
		'isPKConstraint',
		'canBeNull'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLColumnConstraintNode >> accept: aVisitor [
	^aVisitor visitColumnConstraintNode: self
]

{ #category : #initialization }
SQLColumnConstraintNode >> canBeNull [
	^canBeNull
]

{ #category : #initialization }
SQLColumnConstraintNode >> canBeNull: aBoolean [
	canBeNull := aBoolean
]

{ #category : #initialization }
SQLColumnConstraintNode >> children [
	^Array with: self name with: self defaultValue with: self isUnique with: self isPK with: self canBeNull.
]

{ #category : #initialization }
SQLColumnConstraintNode >> defaultValue [
	^defaultValue
]

{ #category : #initialization }
SQLColumnConstraintNode >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : #initialization }
SQLColumnConstraintNode >> initialize [

	isPKConstraint := nil.
	unique := nil.
	canBeNull := nil.
	defaultValue := nil.
]

{ #category : #initialization }
SQLColumnConstraintNode >> isPK [
	^isPKConstraint
	
]

{ #category : #initialization }
SQLColumnConstraintNode >> isPK: aBoolean [
	isPKConstraint := aBoolean
	
]

{ #category : #initialization }
SQLColumnConstraintNode >> isUnique [
	^unique
]

{ #category : #initialization }
SQLColumnConstraintNode >> isUnique: aBoolean [
	unique := aBoolean
	
]
