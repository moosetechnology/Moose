Class {
	#name : #PJFloatLiteralNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'literalValue',
		'isLong',
		'isFloat'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJFloatLiteralNode class >> newFrom: literalString [
	| instanse |
	
	instanse := super new.
	instanse isFloat: literalString last asUppercase = $F.
	instanse literalValue: (instanse isFloat ifTrue: [ literalString allButLast ] ifFalse: [ literalString ]).
	^ instanse 
]

{ #category : #'as yet unclassified' }
PJFloatLiteralNode >> acceptVisitor: aVisitor [
	^ aVisitor visitFloatLiteralNode: self
]

{ #category : #'as yet unclassified' }
PJFloatLiteralNode >> isFloat [
	^ isFloat
]

{ #category : #'as yet unclassified' }
PJFloatLiteralNode >> isFloat: anObject [
	isFloat := anObject
]

{ #category : #'as yet unclassified' }
PJFloatLiteralNode >> literalValue [
	^ literalValue
]

{ #category : #'as yet unclassified' }
PJFloatLiteralNode >> literalValue: anObject [
	literalValue := anObject
]
