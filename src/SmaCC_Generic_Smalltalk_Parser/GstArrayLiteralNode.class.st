Class {
	#name : #GstArrayLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'arrayStart',
		'values',
		'arrayStop'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstArrayLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrayLiteral: self
]

{ #category : #generated }
GstArrayLiteralNode >> arrayStart [
	^ arrayStart
]

{ #category : #generated }
GstArrayLiteralNode >> arrayStart: aSmaCCToken [
	arrayStart := aSmaCCToken
]

{ #category : #generated }
GstArrayLiteralNode >> arrayStop [
	^ arrayStop
]

{ #category : #generated }
GstArrayLiteralNode >> arrayStop: aSmaCCToken [
	arrayStop := aSmaCCToken
]

{ #category : #generated }
GstArrayLiteralNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #'generated-initialize-release' }
GstArrayLiteralNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
]

{ #category : #generated }
GstArrayLiteralNode >> tokenVariables [
	^ #(#arrayStart #arrayStop)
]

{ #category : #generated }
GstArrayLiteralNode >> values [
	^ values
]

{ #category : #generated }
GstArrayLiteralNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
