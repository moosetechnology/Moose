Class {
	#name : #DelphiFormNamedValueNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'name'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormNamedValueNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitNamedValue: self
]

{ #category : #generated }
DelphiFormNamedValueNode >> name [
	^ name
]

{ #category : #generated }
DelphiFormNamedValueNode >> name: aDelphiFormQualifiedNameNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aDelphiFormQualifiedNameNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
DelphiFormNamedValueNode >> nodeVariables [
	^ #(#name)
]
