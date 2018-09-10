Class {
	#name : #DelphiFormPropertyNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'name',
		'equalsToken',
		'value'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormPropertyNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitProperty: self
]

{ #category : #generated }
DelphiFormPropertyNode >> equalsToken [
	^ equalsToken
]

{ #category : #generated }
DelphiFormPropertyNode >> equalsToken: aSmaCCToken [
	equalsToken := aSmaCCToken
]

{ #category : #generated }
DelphiFormPropertyNode >> name [
	^ name
]

{ #category : #generated }
DelphiFormPropertyNode >> name: aDelphiFormQualifiedNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aDelphiFormQualifiedNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
DelphiFormPropertyNode >> nodeVariables [
	^ #(#name #value)
]

{ #category : #generated }
DelphiFormPropertyNode >> tokenVariables [
	^ #(#equalsToken)
]

{ #category : #generated }
DelphiFormPropertyNode >> value [
	^ value
]

{ #category : #generated }
DelphiFormPropertyNode >> value: aDelphiFormParseNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aDelphiFormParseNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
