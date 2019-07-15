Class {
	#name : #JSObjectBindingPatternNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'leftBrace',
		'rightBrace',
		'properties',
		'commas'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSObjectBindingPatternNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitObjectBindingPattern: self
]

{ #category : #generated }
JSObjectBindingPatternNode >> commas [
	^ commas
]

{ #category : #generated }
JSObjectBindingPatternNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSObjectBindingPatternNode >> compositeNodeVariables [
	^ #(#properties)
]

{ #category : #generated }
JSObjectBindingPatternNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSObjectBindingPatternNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSObjectBindingPatternNode >> initialize [
	super initialize.
	properties := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSObjectBindingPatternNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSObjectBindingPatternNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSObjectBindingPatternNode >> properties [
	^ properties
]

{ #category : #generated }
JSObjectBindingPatternNode >> properties: anOrderedCollection [
	self setParents: self properties to: nil.
	properties := anOrderedCollection.
	self setParents: self properties to: self
]

{ #category : #generated }
JSObjectBindingPatternNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSObjectBindingPatternNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
