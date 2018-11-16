Class {
	#name : #GstValueNode,
	#superclass : #GstProgramNode,
	#instVars : [
		'leftParens',
		'rightParens'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstValueNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitValue: self
]

{ #category : #generated }
GstValueNode >> ignoredCompositeTokenVariables [
	^ #(#leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
GstValueNode >> initialize [
	super initialize.
	leftParens := OrderedCollection new: 2.
	rightParens := OrderedCollection new: 2.
]

{ #category : #generated }
GstValueNode >> leftParens [
	^ leftParens
]

{ #category : #generated }
GstValueNode >> leftParens: anOrderedCollection [
	leftParens := anOrderedCollection
]

{ #category : #generated }
GstValueNode >> rightParens [
	^ rightParens
]

{ #category : #generated }
GstValueNode >> rightParens: anOrderedCollection [
	rightParens := anOrderedCollection
]
