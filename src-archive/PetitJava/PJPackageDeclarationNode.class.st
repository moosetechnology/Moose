Class {
	#name : #PJPackageDeclarationNode,
	#superclass : #PJASTNode,
	#instVars : [
		'nameNode'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJPackageDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitPackageDeclarationNode: self
]

{ #category : #accessing }
PJPackageDeclarationNode >> nameNode [
	^ nameNode
]

{ #category : #accessing }
PJPackageDeclarationNode >> nameNode: anObject [
	nameNode := anObject
]
