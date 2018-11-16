Class {
	#name : #JavaClassTypeNode,
	#superclass : #JavaTypeNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaClassTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassType: self
]

{ #category : #generated }
JavaClassTypeNode >> name [
	^ name
]

{ #category : #generated }
JavaClassTypeNode >> name: aJavaProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaClassTypeNode >> nodeVariables [
	^ #(#name)
]
