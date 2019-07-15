Class {
	#name : #JSXAttributeNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'name',
		'equalToken',
		'value'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXAttributeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXAttribute: self
]

{ #category : #generated }
JSXAttributeNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
JSXAttributeNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
JSXAttributeNode >> name [
	^ name
]

{ #category : #generated }
JSXAttributeNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSXAttributeNode >> nodeVariables [
	^ #(#name #value)
]

{ #category : #generated }
JSXAttributeNode >> tokenVariables [
	^ #(#equalToken)
]

{ #category : #generated }
JSXAttributeNode >> value [
	^ value
]

{ #category : #generated }
JSXAttributeNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
