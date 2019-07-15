Class {
	#name : #DelphiExpressionSetTypeNode,
	#superclass : #DelphiSetTypeNode,
	#instVars : [
		'setValue'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiExpressionSetTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExpressionSetType: self
]

{ #category : #generated }
DelphiExpressionSetTypeNode >> nodeVariables [
	^ #(#setValue)
]

{ #category : #generated }
DelphiExpressionSetTypeNode >> setValue [
	^ setValue
]

{ #category : #generated }
DelphiExpressionSetTypeNode >> setValue: aDelphiExpressionNode [
	self setValue notNil
		ifTrue: [ self setValue parent: nil ].
	setValue := aDelphiExpressionNode.
	self setValue notNil
		ifTrue: [ self setValue parent: self ]
]
