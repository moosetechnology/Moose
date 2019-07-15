"
Node representing an if statement. If with and without else are both covere by this node
"
Class {
	#name : #PJIfStatementNode,
	#superclass : #PJStatementNode,
	#instVars : [
		'condition',
		'thenPart',
		'elsePart'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJIfStatementNode >> acceptVisitor: aVisitor [

	^ aVisitor visitIfStatementNode: self
]

{ #category : #accessing }
PJIfStatementNode >> condition [
	^ condition
]

{ #category : #accessing }
PJIfStatementNode >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
PJIfStatementNode >> elsePart [
	^ elsePart
]

{ #category : #accessing }
PJIfStatementNode >> elsePart: anObject [
	elsePart := anObject
]

{ #category : #accessing }
PJIfStatementNode >> thenPart [
	^ thenPart
]

{ #category : #accessing }
PJIfStatementNode >> thenPart: anObject [
	thenPart := anObject
]
