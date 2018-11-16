Class {
	#name : #DelphiNamedTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'typeExpression'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiNamedTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNamedType: self
]

{ #category : #generated }
DelphiNamedTypeNode >> nodeVariables [
	^ #(#typeExpression)
]

{ #category : #generated }
DelphiNamedTypeNode >> typeExpression [
	^ typeExpression
]

{ #category : #generated }
DelphiNamedTypeNode >> typeExpression: aDelphiExpressionNode [
	self typeExpression notNil
		ifTrue: [ self typeExpression parent: nil ].
	typeExpression := aDelphiExpressionNode.
	self typeExpression notNil
		ifTrue: [ self typeExpression parent: self ]
]
