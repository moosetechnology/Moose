Class {
	#name : #DelphiVarsNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'varToken',
		'variableDefinitions'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiVarsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVars: self
]

{ #category : #generated }
DelphiVarsNode >> compositeNodeVariables [
	^ #(#variableDefinitions)
]

{ #category : #'generated-initialize-release' }
DelphiVarsNode >> initialize [
	super initialize.
	variableDefinitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiVarsNode >> tokenVariables [
	^ #(#varToken)
]

{ #category : #generated }
DelphiVarsNode >> varToken [
	^ varToken
]

{ #category : #generated }
DelphiVarsNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
DelphiVarsNode >> variableDefinitions [
	^ variableDefinitions
]

{ #category : #generated }
DelphiVarsNode >> variableDefinitions: anOrderedCollection [
	self setParents: self variableDefinitions to: nil.
	variableDefinitions := anOrderedCollection.
	self setParents: self variableDefinitions to: self
]
