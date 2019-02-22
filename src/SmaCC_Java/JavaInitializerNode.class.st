Class {
	#name : #JavaInitializerNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInitializer: self
]

{ #category : #generated }
JavaInitializerNode >> block [
	^ block
]

{ #category : #generated }
JavaInitializerNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaInitializerNode >> nodeVariables [
	^ #(#block)
]
