"
A part of local variable declaration statement.

Example.
statement: int a;
declarator: a

statement: float a, b = 4;
declarator1: a
declarator2: b = 4
"
Class {
	#name : #PJVariableDeclaratorNode,
	#superclass : #PJASTNode,
	#instVars : [
		'variable',
		'arrayLevel',
		'initializer'
	],
	#category : #'PetitJava-AST'
}

{ #category : #comparing }
PJVariableDeclaratorNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(anotherNode class == self class) ifFalse: [ ^ false].
	
	(self variable = anotherNode variable) ifFalse: [ ^ false ].
	(self arrayLevel = anotherNode arrayLevel) ifFalse: [ ^ false ].
	"
		uncomment when all the comparisons are read ...
	(self initializer = anotherNode initializer) ifFalse: [ ^ false ].
	"
	
	^ true
]

{ #category : #accessing }
PJVariableDeclaratorNode >> acceptVisitor: aVisitor [

	^ aVisitor visitVariableDeclaratorNode: self
]

{ #category : #accessing }
PJVariableDeclaratorNode >> arrayLevel [
	^ arrayLevel
]

{ #category : #accessing }
PJVariableDeclaratorNode >> arrayLevel: anObject [
	arrayLevel := anObject
]

{ #category : #comparing }
PJVariableDeclaratorNode >> hash [
	^ self variable hash bitXor: [self initializer hash]
]

{ #category : #accessing }
PJVariableDeclaratorNode >> initializer [
	^ initializer
]

{ #category : #accessing }
PJVariableDeclaratorNode >> initializer: anObject [
	initializer := anObject
]

{ #category : #accessing }
PJVariableDeclaratorNode >> variable [
	^ variable
]

{ #category : #accessing }
PJVariableDeclaratorNode >> variable: anObject [
	variable := anObject
]
