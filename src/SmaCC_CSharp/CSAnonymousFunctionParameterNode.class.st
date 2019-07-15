Class {
	#name : #CSAnonymousFunctionParameterNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'modifier',
		'type',
		'name'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSAnonymousFunctionParameterNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousFunctionParameter: self
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> modifier [
	^ modifier
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> name [
	^ name
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> tokenVariables [
	^ #(#modifier #name)
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> type [
	^ type
]

{ #category : #generated }
CSAnonymousFunctionParameterNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
