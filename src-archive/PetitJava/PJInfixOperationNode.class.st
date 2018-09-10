"
This node is a STUB!!!!

It's being used for each node that consists of 2 expressions and some operation in between e.g.: +, -, =, +=, ==...
"
Class {
	#name : #PJInfixOperationNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'left',
		'operator',
		'right'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJInfixOperationNode >> acceptVisitor: aVisitor [

	^ aVisitor visitInfixOperationNode: self
]

{ #category : #accessing }
PJInfixOperationNode >> left [
	^ left
]

{ #category : #accessing }
PJInfixOperationNode >> left: anObject [
	left := anObject
]

{ #category : #accessing }
PJInfixOperationNode >> operator [
	^ operator
]

{ #category : #accessing }
PJInfixOperationNode >> operator: anObject [
	operator := anObject
]

{ #category : #accessing }
PJInfixOperationNode >> right [
	^ right
]

{ #category : #accessing }
PJInfixOperationNode >> right: anObject [
	right := anObject
]
