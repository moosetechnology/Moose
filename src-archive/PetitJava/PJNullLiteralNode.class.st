Class {
	#name : #PJNullLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'literalValue'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJNullLiteralNode class >> literalValue: aLiteral [

 ^(self new) literalValue: aLiteral
]

{ #category : #'as yet unclassified' }
PJNullLiteralNode >> acceptVisitor: aVisitor [
	^ aVisitor visitNullLiteralNode: self
]

{ #category : #'as yet unclassified' }
PJNullLiteralNode >> literalValue [
	^ literalValue
]

{ #category : #'as yet unclassified' }
PJNullLiteralNode >> literalValue: anObject [
	literalValue := anObject
]
