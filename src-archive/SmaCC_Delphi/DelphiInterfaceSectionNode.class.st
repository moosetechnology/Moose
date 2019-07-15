Class {
	#name : #DelphiInterfaceSectionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'interfaceToken',
		'usesToken',
		'moduleNames',
		'inTokens',
		'filenames',
		'commas',
		'semicolon',
		'values'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInterfaceSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInterfaceSection: self
]

{ #category : #generated }
DelphiInterfaceSectionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiInterfaceSectionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiInterfaceSectionNode >> compositeNodeVariables [
	^ #(#moduleNames #values)
]

{ #category : #generated }
DelphiInterfaceSectionNode >> compositeTokenVariables [
	^ #(#inTokens #filenames)
]

{ #category : #generated }
DelphiInterfaceSectionNode >> filenames [
	^ filenames
]

{ #category : #generated }
DelphiInterfaceSectionNode >> filenames: anOrderedCollection [
	filenames := anOrderedCollection
]

{ #category : #generated }
DelphiInterfaceSectionNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiInterfaceSectionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiInterfaceSectionNode >> inTokens [
	^ inTokens
]

{ #category : #generated }
DelphiInterfaceSectionNode >> inTokens: anOrderedCollection [
	inTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
DelphiInterfaceSectionNode >> initialize [
	super initialize.
	moduleNames := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	filenames := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	values := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiInterfaceSectionNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
DelphiInterfaceSectionNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceSectionNode >> moduleNames [
	^ moduleNames
]

{ #category : #generated }
DelphiInterfaceSectionNode >> moduleNames: anOrderedCollection [
	self setParents: self moduleNames to: nil.
	moduleNames := anOrderedCollection.
	self setParents: self moduleNames to: self
]

{ #category : #generated }
DelphiInterfaceSectionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiInterfaceSectionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceSectionNode >> tokenVariables [
	^ #(#interfaceToken #usesToken)
]

{ #category : #generated }
DelphiInterfaceSectionNode >> usesToken [
	^ usesToken
]

{ #category : #generated }
DelphiInterfaceSectionNode >> usesToken: aSmaCCToken [
	usesToken := aSmaCCToken
]

{ #category : #generated }
DelphiInterfaceSectionNode >> values [
	^ values
]

{ #category : #generated }
DelphiInterfaceSectionNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
