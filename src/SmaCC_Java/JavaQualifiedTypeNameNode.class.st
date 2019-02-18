Class {
	#name : #JavaQualifiedTypeNameNode,
	#superclass : #JavaTypeNameNode,
	#instVars : [
		'nspace',
		'period'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaQualifiedTypeNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedTypeName: self
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nodeVariables [
	^ #(#nspace)
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nspace [
	^ nspace
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> nspace: aJavaTypeNameNode [
	self nspace notNil
		ifTrue: [ self nspace parent: nil ].
	nspace := aJavaTypeNameNode.
	self nspace notNil
		ifTrue: [ self nspace parent: self ]
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> period [
	^ period
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
JavaQualifiedTypeNameNode >> tokenVariables [
	^ #(#period #name)
]
