Class {
	#name : #JSXSelfClosingElementNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'ltToken',
		'name',
		'slashToken',
		'gtToken',
		'_attributes'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXSelfClosingElementNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
JSXSelfClosingElementNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
JSXSelfClosingElementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXSelfClosingElement: self
]

{ #category : #generated }
JSXSelfClosingElementNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
JSXSelfClosingElementNode >> gtToken [
	^ gtToken
]

{ #category : #generated }
JSXSelfClosingElementNode >> gtToken: aSmaCCToken [
	gtToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
JSXSelfClosingElementNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
JSXSelfClosingElementNode >> ltToken [
	^ ltToken
]

{ #category : #generated }
JSXSelfClosingElementNode >> ltToken: aSmaCCToken [
	ltToken := aSmaCCToken
]

{ #category : #generated }
JSXSelfClosingElementNode >> name [
	^ name
]

{ #category : #generated }
JSXSelfClosingElementNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSXSelfClosingElementNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JSXSelfClosingElementNode >> slashToken [
	^ slashToken
]

{ #category : #generated }
JSXSelfClosingElementNode >> slashToken: aSmaCCToken [
	slashToken := aSmaCCToken
]

{ #category : #generated }
JSXSelfClosingElementNode >> tokenVariables [
	^ #(#ltToken #slashToken #gtToken)
]
