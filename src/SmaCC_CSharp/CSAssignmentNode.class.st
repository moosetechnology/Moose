Class {
	#name : #CSAssignmentNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'lhs',
		'operator',
		'rhs'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssignment: self
]

{ #category : #generated }
CSAssignmentNode >> lhs [
	^ lhs
]

{ #category : #generated }
CSAssignmentNode >> lhs: aCSExpressionNode [
	self lhs notNil
		ifTrue: [ self lhs parent: nil ].
	lhs := aCSExpressionNode.
	self lhs notNil
		ifTrue: [ self lhs parent: self ]
]

{ #category : #generated }
CSAssignmentNode >> nodeVariables [
	^ #(#lhs #rhs)
]

{ #category : #generated }
CSAssignmentNode >> operator [
	^ operator
]

{ #category : #generated }
CSAssignmentNode >> operator: aSmaCCToken [
	operator := aSmaCCToken
]

{ #category : #generated }
CSAssignmentNode >> rhs [
	^ rhs
]

{ #category : #generated }
CSAssignmentNode >> rhs: aCSExpressionNode [
	self rhs notNil
		ifTrue: [ self rhs parent: nil ].
	rhs := aCSExpressionNode.
	self rhs notNil
		ifTrue: [ self rhs parent: self ]
]

{ #category : #generated }
CSAssignmentNode >> tokenVariables [
	^ #(#operator)
]
