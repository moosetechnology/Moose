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
JavaClassTypeNode >> name: aJavaTypeNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJavaTypeNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JavaClassTypeNode >> nodeVariables [
	^ #(#name)
]
