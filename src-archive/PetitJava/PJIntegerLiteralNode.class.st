"
A literal node of an integer valuse
"
Class {
	#name : #PJIntegerLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'literalValue',
		'isLong'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJIntegerLiteralNode class >> newFrom: literalString [
	| instanse |
	instanse := super new.
	instanse isLong: literalString last asUppercase = $L.
	instanse literalValue: (
		Integer readFromJavaString: (
			instanse isLong ifTrue: [ literalString allButLast ] ifFalse: [ literalString ])).
	^ instanse
]

{ #category : #visiting }
PJIntegerLiteralNode >> acceptVisitor: aVisitor [

	^ aVisitor visitIntegerLiteralNode: self
]

{ #category : #accessing }
PJIntegerLiteralNode >> isLong [
	^ isLong
]

{ #category : #accessing }
PJIntegerLiteralNode >> isLong: anObject [
	isLong := anObject
]

{ #category : #accessing }
PJIntegerLiteralNode >> literalValue [
	^ literalValue
]

{ #category : #accessing }
PJIntegerLiteralNode >> literalValue: aBoolean [
	literalValue := aBoolean
]
