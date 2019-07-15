Class {
	#name : #JSXElementNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'openingElement',
		'items',
		'closingElement'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXElementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXElement: self
]

{ #category : #generated }
JSXElementNode >> closingElement [
	^ closingElement
]

{ #category : #generated }
JSXElementNode >> closingElement: aJSXClosingElementNode [
	self closingElement notNil
		ifTrue: [ self closingElement parent: nil ].
	closingElement := aJSXClosingElementNode.
	self closingElement notNil
		ifTrue: [ self closingElement parent: self ]
]

{ #category : #generated }
JSXElementNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
JSXElementNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
JSXElementNode >> items [
	^ items
]

{ #category : #generated }
JSXElementNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
JSXElementNode >> nodeVariables [
	^ #(#openingElement #closingElement)
]

{ #category : #generated }
JSXElementNode >> openingElement [
	^ openingElement
]

{ #category : #generated }
JSXElementNode >> openingElement: aJSXOpeningElementNode [
	self openingElement notNil
		ifTrue: [ self openingElement parent: nil ].
	openingElement := aJSXOpeningElementNode.
	self openingElement notNil
		ifTrue: [ self openingElement parent: self ]
]
