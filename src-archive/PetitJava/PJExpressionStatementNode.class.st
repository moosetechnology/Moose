"
A statement which has nothing but expression in it.


Examples:

5;
a = 5;
a.foo();
a = for(5);
"
Class {
	#name : #PJExpressionStatementNode,
	#superclass : #PJStatementNode,
	#instVars : [
		'expression'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJExpressionStatementNode >> acceptVisitor: aVisitor [

	^ aVisitor visitExpressionStatementNode: self
]

{ #category : #accessing }
PJExpressionStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
PJExpressionStatementNode >> expression: anExpression [
	expression := anExpression
]
