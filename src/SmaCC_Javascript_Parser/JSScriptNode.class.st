Class {
	#name : #JSScriptNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'statements'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSScriptNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitScript: self
]

{ #category : #generated }
JSScriptNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
JSScriptNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSScriptNode >> statements [
	^ statements
]

{ #category : #generated }
JSScriptNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
