"
A node of a string literal.
"
Class {
	#name : #PJStringLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'literalValue'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJStringLiteralNode class >> literalValue: aString [

 ^(self new) literalValue: aString
]

{ #category : #visiting }
PJStringLiteralNode >> acceptVisitor: aVisitor [
	^ aVisitor visitStringLiteralNode: self
]

{ #category : #accessing }
PJStringLiteralNode >> literalValue [
	^ literalValue
]

{ #category : #accessing }
PJStringLiteralNode >> literalValue: anObject [
	literalValue := anObject
]
