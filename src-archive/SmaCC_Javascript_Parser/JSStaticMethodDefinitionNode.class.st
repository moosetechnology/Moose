Class {
	#name : #JSStaticMethodDefinitionNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'staticToken',
		'method'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSStaticMethodDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStaticMethodDefinition: self
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> method [
	^ method
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> method: aJSMethodDefinitionNode [
	self method notNil
		ifTrue: [ self method parent: nil ].
	method := aJSMethodDefinitionNode.
	self method notNil
		ifTrue: [ self method parent: self ]
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> nodeVariables [
	^ #(#method)
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
JSStaticMethodDefinitionNode >> tokenVariables [
	^ #(#staticToken)
]
