Class {
	#name : #PJAbstractTypeDeclarationNode,
	#superclass : #PJBodyDeclarationNode,
	#instVars : [
		'simpleName'
	],
	#category : #'PetitJava-AST'
}

{ #category : #comparing }
PJAbstractTypeDeclarationNode >> = anotherNode [
	(self == anotherNode) ifTrue: [  ^ true ].
	(anotherNode class == self class) ifFalse: [ ^ false].

	^ (self simpleName = anotherNode simpleName)
]

{ #category : #visiting }
PJAbstractTypeDeclarationNode >> acceptVisitor: aVisitor [

	aVisitor visitAbstractTypeDeclarationNode: self
]

{ #category : #comparing }
PJAbstractTypeDeclarationNode >> hash [
	^ self simpleName hash
]

{ #category : #accessing }
PJAbstractTypeDeclarationNode >> simpleName [
	^ simpleName
]

{ #category : #accessing }
PJAbstractTypeDeclarationNode >> simpleName: anObject [
	simpleName := anObject
]
