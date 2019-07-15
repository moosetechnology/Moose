"
Node representing a while loop
"
Class {
	#name : #PJWhileStatementNode,
	#superclass : #PJStatementNode,
	#instVars : [
		'expression',
		'statement'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJWhileStatementNode >> acceptVisitor: aVisitor [

	^ aVisitor visitWhileStatementNode: self
]

{ #category : #accessing }
PJWhileStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
PJWhileStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
PJWhileStatementNode >> statement [
	^ statement
]

{ #category : #accessing }
PJWhileStatementNode >> statement: anObject [
	statement := anObject
]
