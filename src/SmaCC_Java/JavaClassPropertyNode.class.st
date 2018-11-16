Class {
	#name : #JavaClassPropertyNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'type',
		'period',
		'classToken',
		'name',
		'thisToken'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaClassPropertyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassProperty: self
]

{ #category : #generated }
JavaClassPropertyNode >> classToken [
	^ classToken
]

{ #category : #generated }
JavaClassPropertyNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
JavaClassPropertyNode >> name [
	^ name
]

{ #category : #generated }
JavaClassPropertyNode >> name: aJavaNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaClassPropertyNode >> nodeVariables [
	^ #(#type #name)
]

{ #category : #generated }
JavaClassPropertyNode >> period [
	^ period
]

{ #category : #generated }
JavaClassPropertyNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaClassPropertyNode >> thisToken [
	^ thisToken
]

{ #category : #generated }
JavaClassPropertyNode >> thisToken: aSmaCCToken [
	thisToken := aSmaCCToken
]

{ #category : #generated }
JavaClassPropertyNode >> tokenVariables [
	^ #(#period #classToken #thisToken)
]

{ #category : #generated }
JavaClassPropertyNode >> type [
	^ type
]

{ #category : #generated }
JavaClassPropertyNode >> type: aJavaProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
