"
Node representing a local variable declaration statement.

Eg:

int a;
int a = 5;
int a, b;
int a = 5, b;
"
Class {
	#name : #PJLocalVariableDeclarationStatementNode,
	#superclass : #PJStatementNode,
	#instVars : [
		'modifiers',
		'type',
		'declarators'
	],
	#category : #'PetitJava-AST'
}

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> acceptVisitor: aVisitor [

	^ aVisitor visitLocalVariableDeclarationStatementNode: self
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> declarators [
	^ declarators
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> declarators: anObject [
	declarators := anObject
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> modifiers [
	^ modifiers
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> modifiers: anObject [
	modifiers := anObject
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> type [
	^ type
]

{ #category : #accessing }
PJLocalVariableDeclarationStatementNode >> type: anObject [
	type := anObject
]
