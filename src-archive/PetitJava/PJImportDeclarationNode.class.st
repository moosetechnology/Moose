Class {
	#name : #PJImportDeclarationNode,
	#superclass : #PJASTNode,
	#instVars : [
		'nameNode',
		'isStatic',
		'isOnDemand'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJImportDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitImportDeclarationNode: self
]

{ #category : #accessing }
PJImportDeclarationNode >> isOnDemand [
	^ isOnDemand
]

{ #category : #accessing }
PJImportDeclarationNode >> isOnDemand: anObject [
	isOnDemand := anObject
]

{ #category : #accessing }
PJImportDeclarationNode >> isStatic [
	^ isStatic
]

{ #category : #accessing }
PJImportDeclarationNode >> isStatic: anObject [
	isStatic := anObject
]

{ #category : #accessing }
PJImportDeclarationNode >> nameNode [
	^ nameNode
]

{ #category : #accessing }
PJImportDeclarationNode >> nameNode: anObject [
	nameNode := anObject
]
