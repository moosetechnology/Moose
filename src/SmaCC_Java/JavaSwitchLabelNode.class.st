Class {
	#name : #JavaSwitchLabelNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'caseToken',
		'constant',
		'colon'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSwitchLabelNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchLabel: self
]

{ #category : #generated }
JavaSwitchLabelNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
JavaSwitchLabelNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
JavaSwitchLabelNode >> colon [
	^ colon
]

{ #category : #generated }
JavaSwitchLabelNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
JavaSwitchLabelNode >> constant [
	^ constant
]

{ #category : #generated }
JavaSwitchLabelNode >> constant: aJavaExpressionNode [
	self constant notNil
		ifTrue: [ self constant parent: nil ].
	constant := aJavaExpressionNode.
	self constant notNil
		ifTrue: [ self constant parent: self ]
]

{ #category : #generated }
JavaSwitchLabelNode >> nodeVariables [
	^ #(#constant)
]

{ #category : #generated }
JavaSwitchLabelNode >> tokenVariables [
	^ #(#caseToken #colon)
]
