Class {
	#name : #PJParameterDeclaratorNode,
	#superclass : #PJASTNode,
	#instVars : [
		'modifiers',
		'type',
		'identifier',
		'arrayLevel'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJParameterDeclaratorNode >> acceptVisitor: aVisitor [

	^ aVisitor visitParameterDeclaratorNode: self
]

{ #category : #accessing }
PJParameterDeclaratorNode >> arrayLevel [
	^ arrayLevel
]

{ #category : #accessing }
PJParameterDeclaratorNode >> arrayLevel: anObject [
	arrayLevel := anObject
]

{ #category : #accessing }
PJParameterDeclaratorNode >> identifier [
	^ identifier
]

{ #category : #accessing }
PJParameterDeclaratorNode >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
PJParameterDeclaratorNode >> modifiers [
	^ modifiers
]

{ #category : #accessing }
PJParameterDeclaratorNode >> modifiers: anObject [
	modifiers := anObject
]

{ #category : #accessing }
PJParameterDeclaratorNode >> type [
	^ type
]

{ #category : #accessing }
PJParameterDeclaratorNode >> type: anObject [
	type := anObject
]
