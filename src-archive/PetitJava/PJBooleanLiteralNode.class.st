"
Node representing a boolean literal
"
Class {
	#name : #PJBooleanLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'booleanValue'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJBooleanLiteralNode class >> booleanValue: aBoolean [

	^(self new) booleanValue: aBoolean
]

{ #category : #visiting }
PJBooleanLiteralNode >> acceptVisitor: aVisitor [

	^ aVisitor visitBooleanLiteralNode: self
]

{ #category : #accessing }
PJBooleanLiteralNode >> booleanValue [
	^ booleanValue
]

{ #category : #accessing }
PJBooleanLiteralNode >> booleanValue: anObject [
	booleanValue := anObject
]
