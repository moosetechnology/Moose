Class {
	#name : #CSTypeNameNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'name',
		'typeArguments',
		'namespace',
		'periodToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeName: self
]

{ #category : #generated }
CSTypeNameNode >> name [
	^ name
]

{ #category : #generated }
CSTypeNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSTypeNameNode >> namespace [
	^ namespace
]

{ #category : #generated }
CSTypeNameNode >> namespace: aCSTypeNode [
	self namespace notNil
		ifTrue: [ self namespace parent: nil ].
	namespace := aCSTypeNode.
	self namespace notNil
		ifTrue: [ self namespace parent: self ]
]

{ #category : #generated }
CSTypeNameNode >> nodeVariables [
	^ #(#typeArguments #namespace)
]

{ #category : #generated }
CSTypeNameNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CSTypeNameNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CSTypeNameNode >> tokenVariables [
	^ #(#name #periodToken)
]

{ #category : #generated }
CSTypeNameNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
CSTypeNameNode >> typeArguments: aCSTypeArgumentListNode [
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]
]
