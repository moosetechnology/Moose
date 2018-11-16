Class {
	#name : #JSPropertyAssignmentNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'name',
		'colonToken',
		'value',
		'equalToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSPropertyAssignmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyAssignment: self
]

{ #category : #generated }
JSPropertyAssignmentNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
JSPropertyAssignmentNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #generated }
JSPropertyAssignmentNode >> name [
	^ name
]

{ #category : #generated }
JSPropertyAssignmentNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSPropertyAssignmentNode >> nodeVariables [
	^ #(#name #value)
]

{ #category : #generated }
JSPropertyAssignmentNode >> tokenVariables [
	^ #(#equalToken)
]

{ #category : #generated }
JSPropertyAssignmentNode >> value [
	^ value
]

{ #category : #generated }
JSPropertyAssignmentNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
