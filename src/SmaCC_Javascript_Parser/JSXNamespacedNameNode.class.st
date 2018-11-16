Class {
	#name : #JSXNamespacedNameNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'identifiers',
		'colonToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSXNamespacedNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitXNamespacedName: self
]

{ #category : #generated }
JSXNamespacedNameNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
JSXNamespacedNameNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
JSXNamespacedNameNode >> compositeTokenVariables [
	^ #(#identifiers)
]

{ #category : #generated }
JSXNamespacedNameNode >> identifiers [
	^ identifiers
]

{ #category : #generated }
JSXNamespacedNameNode >> identifiers: anOrderedCollection [
	identifiers := anOrderedCollection
]

{ #category : #generated }
JSXNamespacedNameNode >> ignoredTokenVariables [
	^ #(#colonToken)
]

{ #category : #'generated-initialize-release' }
JSXNamespacedNameNode >> initialize [
	super initialize.
	identifiers := OrderedCollection new: 2.
]
