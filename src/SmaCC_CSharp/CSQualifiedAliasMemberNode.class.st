Class {
	#name : #CSQualifiedAliasMemberNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'global',
		'colonColonToken',
		'name',
		'typeArguments'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSQualifiedAliasMemberNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedAliasMember: self
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> colonColonToken [
	^ colonColonToken
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> colonColonToken: aSmaCCToken [
	colonColonToken := aSmaCCToken
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> global [
	^ global
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> global: aSmaCCToken [
	global := aSmaCCToken
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> name [
	^ name
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> nodeVariables [
	^ #(#typeArguments)
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> tokenVariables [
	^ #(#global #colonColonToken #name)
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> typeArguments [
	^ typeArguments
]

{ #category : #generated }
CSQualifiedAliasMemberNode >> typeArguments: aCSTypeArgumentListNode [
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: nil ].
	typeArguments := aCSTypeArgumentListNode.
	self typeArguments notNil
		ifTrue: [ self typeArguments parent: self ]
]
