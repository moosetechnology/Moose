Class {
	#name : #GstSequenceNode,
	#superclass : #GstProgramNode,
	#instVars : [
		'leftBar',
		'variables',
		'rightBar',
		'statements',
		'periods'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstSequenceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSequence: self
]

{ #category : #generated }
GstSequenceNode >> compositeNodeVariables [
	^ #(#variables #statements)
]

{ #category : #generated }
GstSequenceNode >> ignoredCompositeTokenVariables [
	^ #(#periods)
]

{ #category : #generated }
GstSequenceNode >> ignoredTokenVariables [
	^ #(#leftBar #rightBar)
]

{ #category : #'generated-initialize-release' }
GstSequenceNode >> initialize [
	super initialize.
	variables := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
	periods := OrderedCollection new: 2.
]

{ #category : #generated }
GstSequenceNode >> leftBar [
	^ leftBar
]

{ #category : #generated }
GstSequenceNode >> leftBar: aSmaCCToken [
	leftBar := aSmaCCToken
]

{ #category : #generated }
GstSequenceNode >> periods [
	^ periods
]

{ #category : #generated }
GstSequenceNode >> periods: anOrderedCollection [
	periods := anOrderedCollection
]

{ #category : #generated }
GstSequenceNode >> rightBar [
	^ rightBar
]

{ #category : #generated }
GstSequenceNode >> rightBar: aSmaCCToken [
	rightBar := aSmaCCToken
]

{ #category : #generated }
GstSequenceNode >> statements [
	^ statements
]

{ #category : #generated }
GstSequenceNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
GstSequenceNode >> variables [
	^ variables
]

{ #category : #generated }
GstSequenceNode >> variables: anOrderedCollection [
	self setParents: self variables to: nil.
	variables := anOrderedCollection.
	self setParents: self variables to: self
]
