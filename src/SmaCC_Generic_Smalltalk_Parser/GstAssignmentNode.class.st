Class {
	#name : #GstAssignmentNode,
	#superclass : #GstValueNode,
	#instVars : [
		'variable',
		'assignmentToken',
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAssignment: self
]

{ #category : #generated }
GstAssignmentNode >> assignmentToken [
	^ assignmentToken
]

{ #category : #generated }
GstAssignmentNode >> assignmentToken: aSmaCCToken [
	assignmentToken := aSmaCCToken
]

{ #category : #generated }
GstAssignmentNode >> nodeVariables [
	^ #(#variable #value)
]

{ #category : #generated }
GstAssignmentNode >> tokenVariables [
	^ #(#assignmentToken)
]

{ #category : #generated }
GstAssignmentNode >> value [
	^ value
]

{ #category : #generated }
GstAssignmentNode >> value: aGstValueNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aGstValueNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]

{ #category : #generated }
GstAssignmentNode >> variable [
	^ variable
]

{ #category : #generated }
GstAssignmentNode >> variable: aGstVariableNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aGstVariableNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
