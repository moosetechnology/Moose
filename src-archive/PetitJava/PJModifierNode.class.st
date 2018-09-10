Class {
	#name : #PJModifierNode,
	#superclass : #PJASTNode,
	#instVars : [
		'keyword'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJModifierNode class >> keyword: aString [

	^(self new) keyword: aString; yourself
]

{ #category : #testing }
PJModifierNode >> isAnnotation [

	^false
]

{ #category : #testing }
PJModifierNode >> isModifier [

	^true
]

{ #category : #accessing }
PJModifierNode >> keyword [
	^ keyword
]

{ #category : #accessing }
PJModifierNode >> keyword: anObject [
	keyword := anObject
]
