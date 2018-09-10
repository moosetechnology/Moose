"
A delayed send that has some or all of the arguments defined in advance. Additionally supplied arguments will be added, if possible, to these when the object is evaluate.

Instance Variables
	arguments:		<Array>

arguments
	- the predefined arguments

"
Class {
	#name : #GRBoundMessage,
	#superclass : #GRDelayedSendMessage,
	#instVars : [
		'arguments'
	],
	#category : #'Grease-Core-Utilities'
}

{ #category : #'instance creation' }
GRBoundMessage class >> selector: aSymbol [
	^ self selector: aSymbol arguments: #()
]

{ #category : #'instance creation' }
GRBoundMessage class >> selector: aSymbol arguments: anArray [
	^ self basicNew
		initializeWithSelector: aSymbol arguments: anArray;
		yourself
]

{ #category : #delegation }
GRBoundMessage >> argumentCount [
	^ selector numArgs - arguments size
]

{ #category : #initialization }
GRBoundMessage >> initializeWithSelector: aSymbol arguments: anArray [
	self initializeWithSelector: aSymbol.
	arguments := anArray asArray
]

{ #category : #private }
GRBoundMessage >> mergeArguments: anArray [
	^ arguments , anArray
]

{ #category : #printing }
GRBoundMessage >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' arguments: '; print: arguments
]
