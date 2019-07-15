Class {
	#name : #GstBlockNode,
	#superclass : #GstValueNode,
	#instVars : [
		'leftBracket',
		'colons',
		'variables',
		'bar',
		'body',
		'rightBracket'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstBlockNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBlock: self
]

{ #category : #generated }
GstBlockNode >> bar [
	^ bar
]

{ #category : #generated }
GstBlockNode >> bar: aSmaCCToken [
	bar := aSmaCCToken
]

{ #category : #generated }
GstBlockNode >> body [
	^ body
]

{ #category : #generated }
GstBlockNode >> body: aGstSequenceNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aGstSequenceNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
GstBlockNode >> colons [
	^ colons
]

{ #category : #generated }
GstBlockNode >> colons: anOrderedCollection [
	colons := anOrderedCollection
]

{ #category : #generated }
GstBlockNode >> compositeNodeVariables [
	^ #(#variables)
]

{ #category : #generated }
GstBlockNode >> ignoredCompositeTokenVariables [
	^ #(#colons #leftParens #rightParens)
]

{ #category : #generated }
GstBlockNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #'generated-initialize-release' }
GstBlockNode >> initialize [
	super initialize.
	colons := OrderedCollection new: 2.
	variables := OrderedCollection new: 2.
]

{ #category : #generated }
GstBlockNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
GstBlockNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
GstBlockNode >> nodeVariables [
	^ #(#body)
]

{ #category : #generated }
GstBlockNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
GstBlockNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]

{ #category : #generated }
GstBlockNode >> tokenVariables [
	^ #(#bar)
]

{ #category : #generated }
GstBlockNode >> variables [
	^ variables
]

{ #category : #generated }
GstBlockNode >> variables: anOrderedCollection [
	self setParents: self variables to: nil.
	variables := anOrderedCollection.
	self setParents: self variables to: self
]
