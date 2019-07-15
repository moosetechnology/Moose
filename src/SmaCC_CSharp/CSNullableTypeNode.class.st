Class {
	#name : #CSNullableTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'type',
		'questionMarkToken'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSNullableTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNullableType: self
]

{ #category : #generated }
CSNullableTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSNullableTypeNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
CSNullableTypeNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
CSNullableTypeNode >> tokenVariables [
	^ #(#questionMarkToken)
]

{ #category : #generated }
CSNullableTypeNode >> type [
	^ type
]

{ #category : #generated }
CSNullableTypeNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
