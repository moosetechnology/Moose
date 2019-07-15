Class {
	#name : #PJSeparatorNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'separatorValue'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJSeparatorNode class >> separatorValue: aString [

 ^(self new) separatorValue: aString
]

{ #category : #'as yet unclassified' }
PJSeparatorNode >> acceptVisitor: aVisitor [
	^ aVisitor visitSeparatorNode: self
]

{ #category : #'as yet unclassified' }
PJSeparatorNode >> separatorValue [
	^ separatorValue.
]

{ #category : #'as yet unclassified' }
PJSeparatorNode >> separatorValue: anObject [
	separatorValue := anObject
]
