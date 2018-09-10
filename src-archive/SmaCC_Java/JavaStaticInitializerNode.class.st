Class {
	#name : #JavaStaticInitializerNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'staticToken',
		'block'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaStaticInitializerNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStaticInitializer: self
]

{ #category : #generated }
JavaStaticInitializerNode >> block [
	^ block
]

{ #category : #generated }
JavaStaticInitializerNode >> block: aJavaBlockNode [
	self block notNil
		ifTrue: [ self block parent: nil ].
	block := aJavaBlockNode.
	self block notNil
		ifTrue: [ self block parent: self ]
]

{ #category : #generated }
JavaStaticInitializerNode >> nodeVariables [
	^ #(#block)
]

{ #category : #generated }
JavaStaticInitializerNode >> staticToken [
	^ staticToken
]

{ #category : #generated }
JavaStaticInitializerNode >> staticToken: aSmaCCToken [
	staticToken := aSmaCCToken
]

{ #category : #generated }
JavaStaticInitializerNode >> tokenVariables [
	^ #(#staticToken)
]
