Class {
	#name : #PJArrayTypeNode,
	#superclass : #PJTypeNode,
	#instVars : [
		'dimensions',
		'elementType'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJArrayTypeNode class >> elementType: aTypeNode dimensions: aNumber [

	^(self new) elementType: aTypeNode; dimensions: aNumber; yourself
]

{ #category : #accessing }
PJArrayTypeNode >> dimensions [
	^ dimensions
]

{ #category : #accessing }
PJArrayTypeNode >> dimensions: anObject [
	dimensions := anObject
]

{ #category : #accessing }
PJArrayTypeNode >> elementType [
	^ elementType
]

{ #category : #accessing }
PJArrayTypeNode >> elementType: anObject [
	elementType := anObject
]

{ #category : #accessing }
PJArrayTypeNode >> type [ 

	^type ifNil: [type := 
			((1 to: dimensions) 
				inject: elementType type 
				into: [:current :parenthesis |
					(current , '[]')]) ]
]
