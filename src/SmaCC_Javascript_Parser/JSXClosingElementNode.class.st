Class {
	#name : #JSXClosingElementNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'ltToken',
		'slashToken',
		'name',
		'gtToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXClosingElementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXClosingElement: self
]

{ #category : #generated }
JSXClosingElementNode >> gtToken [
	^ gtToken
]

{ #category : #generated }
JSXClosingElementNode >> gtToken: aSmaCCToken [
	gtToken := aSmaCCToken
]

{ #category : #generated }
JSXClosingElementNode >> ltToken [
	^ ltToken
]

{ #category : #generated }
JSXClosingElementNode >> ltToken: aSmaCCToken [
	ltToken := aSmaCCToken
]

{ #category : #generated }
JSXClosingElementNode >> name [
	^ name
]

{ #category : #generated }
JSXClosingElementNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSXClosingElementNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JSXClosingElementNode >> slashToken [
	^ slashToken
]

{ #category : #generated }
JSXClosingElementNode >> slashToken: aSmaCCToken [
	slashToken := aSmaCCToken
]

{ #category : #generated }
JSXClosingElementNode >> tokenVariables [
	^ #(#ltToken #slashToken #gtToken)
]
