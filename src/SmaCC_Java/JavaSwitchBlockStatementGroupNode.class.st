Class {
	#name : #JavaSwitchBlockStatementGroupNode,
	#superclass : #JavaProgramNode,
	#instVars : [
		'labels',
		'statements'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchBlockStatementGroup: self
]

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> compositeNodeVariables [
	^ #(#labels #statements)
]

{ #category : #'generated-initialize-release' }
JavaSwitchBlockStatementGroupNode >> initialize [
	super initialize.
	labels := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> labels [
	^ labels
]

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> labels: anOrderedCollection [
	self setParents: self labels to: nil.
	labels := anOrderedCollection.
	self setParents: self labels to: self
]

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> statements [
	^ statements
]

{ #category : #generated }
JavaSwitchBlockStatementGroupNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
