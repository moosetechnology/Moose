"
constructor-specific behavioural entity.

more in superclass comment
"
Class {
	#name : #PJConstructorDeclarationNode,
	#superclass : #PJBehaviouralNode,
	#instVars : [
		'constructorInvocation',
		'statements'
	],
	#category : #'PetitJava-AST'
}

{ #category : #accessing }
PJConstructorDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitConstructorDeclarationNode: self
]

{ #category : #accessing }
PJConstructorDeclarationNode >> constructorInvocation [
	^ constructorInvocation
]

{ #category : #accessing }
PJConstructorDeclarationNode >> constructorInvocation: aConstructorInvocation [
	constructorInvocation := aConstructorInvocation
]

{ #category : #accessing }
PJConstructorDeclarationNode >> statements [
	^ statements
]

{ #category : #accessing }
PJConstructorDeclarationNode >> statements: aCollection [ 
	statements := aCollection 
]
