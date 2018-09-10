Class {
	#name : #DelphiEnumNameNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'name',
		'equal',
		'value'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiEnumNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEnumName: self
]

{ #category : #generated }
DelphiEnumNameNode >> equal [
	^ equal
]

{ #category : #generated }
DelphiEnumNameNode >> equal: aSmaCCToken [
	equal := aSmaCCToken
]

{ #category : #generated }
DelphiEnumNameNode >> name [
	^ name
]

{ #category : #generated }
DelphiEnumNameNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiEnumNameNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
DelphiEnumNameNode >> tokenVariables [
	^ #(#name #equal)
]

{ #category : #generated }
DelphiEnumNameNode >> value [
	^ value
]

{ #category : #generated }
DelphiEnumNameNode >> value: aDelphiExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
