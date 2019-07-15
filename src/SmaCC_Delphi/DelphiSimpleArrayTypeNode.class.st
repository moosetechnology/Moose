Class {
	#name : #DelphiSimpleArrayTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'type',
		'left',
		'bounds',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiSimpleArrayTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSimpleArrayType: self
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> bounds [
	^ bounds
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> bounds: aDelphiExpressionNode [
	self bounds notNil
		ifTrue: [ self bounds parent: nil ].
	bounds := aDelphiExpressionNode.
	self bounds notNil
		ifTrue: [ self bounds parent: self ]
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> nodeVariables [
	^ #(#type #bounds)
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> tokenVariables [
	^ #(#left #right)
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiSimpleArrayTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
