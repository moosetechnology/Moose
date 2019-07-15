Class {
	#name : #JSXOpeningElementNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'ltToken',
		'name',
		'gtToken',
		'_attributes'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXOpeningElementNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
JSXOpeningElementNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
JSXOpeningElementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXOpeningElement: self
]

{ #category : #generated }
JSXOpeningElementNode >> compositeNodeVariables [
	^ #(#_attributes)
]

{ #category : #generated }
JSXOpeningElementNode >> gtToken [
	^ gtToken
]

{ #category : #generated }
JSXOpeningElementNode >> gtToken: aSmaCCToken [
	gtToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
JSXOpeningElementNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
]

{ #category : #generated }
JSXOpeningElementNode >> ltToken [
	^ ltToken
]

{ #category : #generated }
JSXOpeningElementNode >> ltToken: aSmaCCToken [
	ltToken := aSmaCCToken
]

{ #category : #generated }
JSXOpeningElementNode >> name [
	^ name
]

{ #category : #generated }
JSXOpeningElementNode >> name: aJSProgramNode [
	self name notNil
		ifTrue: [ self name parent: nil ].
	name := aJSProgramNode.
	self name notNil
		ifTrue: [ self name parent: self ]
]

{ #category : #generated }
JSXOpeningElementNode >> nodeVariables [
	^ #(#name)
]

{ #category : #generated }
JSXOpeningElementNode >> tokenVariables [
	^ #(#ltToken #gtToken)
]
