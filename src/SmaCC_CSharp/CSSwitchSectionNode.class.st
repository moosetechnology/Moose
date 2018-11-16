Class {
	#name : #CSSwitchSectionNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'labels',
		'statements'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSSwitchSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSwitchSection: self
]

{ #category : #generated }
CSSwitchSectionNode >> compositeNodeVariables [
	^ #(#labels #statements)
]

{ #category : #'generated-initialize-release' }
CSSwitchSectionNode >> initialize [
	super initialize.
	labels := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
CSSwitchSectionNode >> labels [
	^ labels
]

{ #category : #generated }
CSSwitchSectionNode >> labels: anOrderedCollection [
	self setParents: self labels to: nil.
	labels := anOrderedCollection.
	self setParents: self labels to: self
]

{ #category : #generated }
CSSwitchSectionNode >> statements [
	^ statements
]

{ #category : #generated }
CSSwitchSectionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
