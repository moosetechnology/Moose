Class {
	#name : #JSXFragmentNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'ltTokens',
		'gtTokens',
		'items',
		'slashToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXFragmentNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXFragment: self
]

{ #category : #generated }
JSXFragmentNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #generated }
JSXFragmentNode >> compositeTokenVariables [
	^ #(#ltTokens #gtTokens)
]

{ #category : #generated }
JSXFragmentNode >> gtTokens [
	^ gtTokens
]

{ #category : #generated }
JSXFragmentNode >> gtTokens: anOrderedCollection [
	gtTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
JSXFragmentNode >> initialize [
	super initialize.
	ltTokens := OrderedCollection new: 2.
	gtTokens := OrderedCollection new: 2.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
JSXFragmentNode >> items [
	^ items
]

{ #category : #generated }
JSXFragmentNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]

{ #category : #generated }
JSXFragmentNode >> ltTokens [
	^ ltTokens
]

{ #category : #generated }
JSXFragmentNode >> ltTokens: anOrderedCollection [
	ltTokens := anOrderedCollection
]

{ #category : #generated }
JSXFragmentNode >> slashToken [
	^ slashToken
]

{ #category : #generated }
JSXFragmentNode >> slashToken: aSmaCCToken [
	slashToken := aSmaCCToken
]

{ #category : #generated }
JSXFragmentNode >> tokenVariables [
	^ #(#slashToken)
]
