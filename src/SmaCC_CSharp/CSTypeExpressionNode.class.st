Class {
	#name : #CSTypeExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'type'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeExpression: self
]

{ #category : #generated }
CSTypeExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CSTypeExpressionNode >> type [
	^ type
]

{ #category : #generated }
CSTypeExpressionNode >> type: aCSTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCSTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
