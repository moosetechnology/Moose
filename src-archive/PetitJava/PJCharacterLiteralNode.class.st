Class {
	#name : #PJCharacterLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'literalValue'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJCharacterLiteralNode class >> literalValue: aString [
 ^(self new) literalValue: aString
]

{ #category : #'as yet unclassified' }
PJCharacterLiteralNode >> acceptVisitor: aVisitor [
	^ aVisitor visitCharacterLiteralNode: self
]

{ #category : #'as yet unclassified' }
PJCharacterLiteralNode >> literalValue [
	^ literalValue
]

{ #category : #'as yet unclassified' }
PJCharacterLiteralNode >> literalValue: anObject [
	literalValue := anObject
]
