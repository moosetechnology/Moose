Class {
	#name : #DelphiConstantListNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'constToken',
		'definitions'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiConstantListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitConstantList: self
]

{ #category : #generated }
DelphiConstantListNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
DelphiConstantListNode >> constToken [
	^ constToken
]

{ #category : #generated }
DelphiConstantListNode >> constToken: aSmaCCToken [
	constToken := aSmaCCToken
]

{ #category : #generated }
DelphiConstantListNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiConstantListNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #'generated-initialize-release' }
DelphiConstantListNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiConstantListNode >> tokenVariables [
	^ #(#constToken)
]
