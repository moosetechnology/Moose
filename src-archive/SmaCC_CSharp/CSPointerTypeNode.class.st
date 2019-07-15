Class {
	#name : #CSPointerTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'type',
		'timesToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSPointerTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPointerType: self
]

{ #category : #generated }
CSPointerTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSPointerTypeNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
CSPointerTypeNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
CSPointerTypeNode >> tokenVariables [
	^ #(#timesToken)
]

{ #category : #generated }
CSPointerTypeNode >> type [
	^ type
]

{ #category : #generated }
CSPointerTypeNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
