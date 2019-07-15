Class {
	#name : #JavaSwitchBlockNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'leftBrace',
		'statementGroups',
		'labels',
		'rightBrace'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSwitchBlockNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchBlock: self
]

{ #category : #generated }
JavaSwitchBlockNode >> compositeNodeVariables [
	^ #(#statementGroups #labels)
]

{ #category : #generated }
JavaSwitchBlockNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JavaSwitchBlockNode >> initialize [
	super initialize.
	statementGroups := OrderedCollection new: 2.
	labels := OrderedCollection new: 2.
]

{ #category : #generated }
JavaSwitchBlockNode >> labels [
	^ labels
]

{ #category : #generated }
JavaSwitchBlockNode >> labels: anOrderedCollection [
	self setParents: self labels to: nil.
	labels := anOrderedCollection.
	self setParents: self labels to: self
]

{ #category : #generated }
JavaSwitchBlockNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JavaSwitchBlockNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JavaSwitchBlockNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JavaSwitchBlockNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JavaSwitchBlockNode >> statementGroups [
	^ statementGroups
]

{ #category : #generated }
JavaSwitchBlockNode >> statementGroups: anOrderedCollection [
	self setParents: self statementGroups to: nil.
	statementGroups := anOrderedCollection.
	self setParents: self statementGroups to: self
]
