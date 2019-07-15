Class {
	#name : #JavaQualifiedNameNode,
	#superclass : #JavaNameNode,
	#instVars : [
		'nspace',
		'period'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaQualifiedNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedName: self
]

{ #category : #generated }
JavaQualifiedNameNode >> nodeVariables [
	^ #(#nspace)
]

{ #category : #generated }
JavaQualifiedNameNode >> nspace [
	^ nspace
]

{ #category : #generated }
JavaQualifiedNameNode >> nspace: aJavaNameNode [
	self nspace notNil
		ifTrue: [ self nspace parent: nil ].
	nspace := aJavaNameNode.
	self nspace notNil
		ifTrue: [ self nspace parent: self ]
]

{ #category : #generated }
JavaQualifiedNameNode >> period [
	^ period
]

{ #category : #generated }
JavaQualifiedNameNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedNameNode >> tokenVariables [
	^ #(#period #name)
]
