Class {
	#name : #JavaAssignmentNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'variable',
		'op',
		'value'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssignment: self
]

{ #category : #generated }
JavaAssignmentNode >> nodeVariables [
	^ #(#variable #value)
]

{ #category : #generated }
JavaAssignmentNode >> op [
	^ op
]

{ #category : #generated }
JavaAssignmentNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
JavaAssignmentNode >> tokenVariables [
	^ #(#op)
]

{ #category : #generated }
JavaAssignmentNode >> value [
	^ value
]

{ #category : #generated }
JavaAssignmentNode >> value: aJavaExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJavaExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]

{ #category : #generated }
JavaAssignmentNode >> variable [
	^ variable
]

{ #category : #generated }
JavaAssignmentNode >> variable: aJavaExpressionNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJavaExpressionNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
