Class {
	#name : #JSBindingPropertyNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'name',
		'colonToken',
		'element'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSBindingPropertyNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBindingProperty: self
]

{ #category : #generated }
JSBindingPropertyNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSBindingPropertyNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSBindingPropertyNode >> element [
	^ element
]

{ #category : #generated }
JSBindingPropertyNode >> element: aJSVariableDeclarationNode [
	self element notNil
		ifTrue: [ self element parent: nil ].
	element := aJSVariableDeclarationNode.
	self element notNil
		ifTrue: [ self element parent: self ]
]

{ #category : #generated }
JSBindingPropertyNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #generated }
JSBindingPropertyNode >> name [
	^ name
]

{ #category : #generated }
JSBindingPropertyNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSBindingPropertyNode >> nodeVariables [
	^ #(#name #element)
]
