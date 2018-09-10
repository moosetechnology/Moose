"
Return statement node.

Ex:

return 5;
return 5+a.foo();
return a;
"
Class {
	#name : #PJReturnStatementNode,
	#superclass : #PJStatementNode,
	#instVars : [
		'expression'
	],
	#category : #'PetitJava-AST'
}

{ #category : #visiting }
PJReturnStatementNode >> acceptVisitor: aVisitor [

	^ aVisitor visitReturnStatementNode: self
]

{ #category : #accessing }
PJReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
PJReturnStatementNode >> expression: anExpression [
	expression := anExpression
]
