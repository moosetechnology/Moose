Class {
	#name : #CSNamedArgumentNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'name',
		'equal',
		'value'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNamedArgumentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedArgument: self
]

{ #category : #generated }
CSNamedArgumentNode >> equal [
	^ equal
]

{ #category : #generated }
CSNamedArgumentNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
CSNamedArgumentNode >> name [
	^ name
]

{ #category : #generated }
CSNamedArgumentNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSNamedArgumentNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
CSNamedArgumentNode >> tokenVariables [
	^ #(#name #equal)
]

{ #category : #generated }
CSNamedArgumentNode >> value [
	^ value
]

{ #category : #generated }
CSNamedArgumentNode >> value: aCSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aCSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
