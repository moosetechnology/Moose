Class {
	#name : #JSAssignmentExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'lhs',
		'operator',
		'rhs'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSAssignmentExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssignmentExpression: self
]

{ #category : #generated }
JSAssignmentExpressionNode >> lhs [
	^ lhs
]

{ #category : #generated }
JSAssignmentExpressionNode >> lhs: aJSExpressionNode [
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aJSExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]
]

{ #category : #generated }
JSAssignmentExpressionNode >> nodeVariables [
	^ #(#lhs #rhs)
]

{ #category : #generated }
JSAssignmentExpressionNode >> operator [
	^ operator
]

{ #category : #generated }
JSAssignmentExpressionNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
JSAssignmentExpressionNode >> rhs [
	^ rhs
]

{ #category : #generated }
JSAssignmentExpressionNode >> rhs: aJSExpressionNode [
	self rhs notNil
		ifTrue: [ self rhs parent: nil ].
	rhs := aJSExpressionNode.
	self rhs notNil
		ifTrue: [ self rhs parent: self ]
]

{ #category : #generated }
JSAssignmentExpressionNode >> tokenVariables [
	^ #(#operator)
]
