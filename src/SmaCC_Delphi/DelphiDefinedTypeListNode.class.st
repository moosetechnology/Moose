Class {
	#name : #DelphiDefinedTypeListNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'typeToken',
		'definitions'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiDefinedTypeListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitDefinedTypeList: self
]

{ #category : #generated }
DelphiDefinedTypeListNode >> compositeNodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
DelphiDefinedTypeListNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiDefinedTypeListNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #'generated-initialize-release' }
DelphiDefinedTypeListNode >> initialize [
	super initialize.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiDefinedTypeListNode >> tokenVariables [
	^ #(#typeToken)
]

{ #category : #generated }
DelphiDefinedTypeListNode >> typeToken [
	^ typeToken
]

{ #category : #generated }
DelphiDefinedTypeListNode >> typeToken: aSmaCCToken [
	typeToken := aSmaCCToken
]
