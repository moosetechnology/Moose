"
General body declaration of a class or method
"
Class {
	#name : #PJBodyDeclarationNode,
	#superclass : #PJASTNode,
	#instVars : [
		'modifiers'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJBodyDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitBodyDeclarationNode: self
]

{ #category : #accessing }
PJBodyDeclarationNode >> modifiers [
	^ modifiers
]

{ #category : #accessing }
PJBodyDeclarationNode >> modifiers: anObject [
	modifiers := anObject
]
