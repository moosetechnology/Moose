"
non-constructor behavioural entity (method-specific).

more in superclass comment
"
Class {
	#name : #PJMethodDeclarationNode,
	#superclass : #PJBehaviouralNode,
	#instVars : [
		'body'
	],
	#classInstVars : [
		'aVisitor'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJMethodDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitMethodDeclarationNode: self
]

{ #category : #accessing }
PJMethodDeclarationNode >> body [
	^ body
]

{ #category : #accessing }
PJMethodDeclarationNode >> body: anObject [
	body := anObject
]
