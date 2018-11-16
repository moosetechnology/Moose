Class {
	#name : #DelphiResourceStringListNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'resourceStringToken',
		'definitions'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiResourceStringListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitResourceStringList: self
]

{ #category : #generated }
DelphiResourceStringListNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
DelphiResourceStringListNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiResourceStringListNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #'generated-initialize-release' }
DelphiResourceStringListNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiResourceStringListNode >> resourceStringToken [
	^ resourceStringToken
]

{ #category : #generated }
DelphiResourceStringListNode >> resourceStringToken: aSmaCCToken [
	resourceStringToken := aSmaCCToken
]

{ #category : #generated }
DelphiResourceStringListNode >> tokenVariables [
	^ #(#resourceStringToken)
]
