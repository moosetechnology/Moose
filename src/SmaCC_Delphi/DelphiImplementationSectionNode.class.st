Class {
	#name : #DelphiImplementationSectionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'implementationToken',
		'usesToken',
		'moduleNames',
		'inTokens',
		'filenames',
		'commas',
		'semicolon',
		'definitions',
		'code'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiImplementationSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImplementationSection: self
]

{ #category : #generated }
DelphiImplementationSectionNode >> code [
	^ code
]

{ #category : #generated }
DelphiImplementationSectionNode >> code: aDelphiImplementationCodeNode [
	self code notNil
		ifTrue: [ self code parent: nil ].
	code := aDelphiImplementationCodeNode.
	self code notNil
		ifTrue: [ self code parent: self ]
]

{ #category : #generated }
DelphiImplementationSectionNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiImplementationSectionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiImplementationSectionNode >> compositeNodeVariables [
	^ #(#moduleNames #definitions)
]

{ #category : #generated }
DelphiImplementationSectionNode >> compositeTokenVariables [
	^ #(#inTokens #filenames)
]

{ #category : #generated }
DelphiImplementationSectionNode >> definitions [
	^ definitions
]

{ #category : #generated }
DelphiImplementationSectionNode >> definitions: anOrderedCollection [
	self setParents: self definitions to: nil.
	definitions := anOrderedCollection.
	self setParents: self definitions to: self
]

{ #category : #generated }
DelphiImplementationSectionNode >> filenames [
	^ filenames
]

{ #category : #generated }
DelphiImplementationSectionNode >> filenames: anOrderedCollection [
	filenames := anOrderedCollection
]

{ #category : #generated }
DelphiImplementationSectionNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiImplementationSectionNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiImplementationSectionNode >> implementationToken [
	^ implementationToken
]

{ #category : #generated }
DelphiImplementationSectionNode >> implementationToken: aSmaCCToken [
	implementationToken := aSmaCCToken
]

{ #category : #generated }
DelphiImplementationSectionNode >> inTokens [
	^ inTokens
]

{ #category : #generated }
DelphiImplementationSectionNode >> inTokens: anOrderedCollection [
	inTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
DelphiImplementationSectionNode >> initialize [
	super initialize.
	moduleNames := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	filenames := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	definitions := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiImplementationSectionNode >> moduleNames [
	^ moduleNames
]

{ #category : #generated }
DelphiImplementationSectionNode >> moduleNames: anOrderedCollection [
	self setParents: self moduleNames to: nil.
	moduleNames := anOrderedCollection.
	self setParents: self moduleNames to: self
]

{ #category : #generated }
DelphiImplementationSectionNode >> nodeVariables [
	^ #(#code)
]

{ #category : #generated }
DelphiImplementationSectionNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiImplementationSectionNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiImplementationSectionNode >> tokenVariables [
	^ #(#implementationToken #usesToken)
]

{ #category : #generated }
DelphiImplementationSectionNode >> usesToken [
	^ usesToken
]

{ #category : #generated }
DelphiImplementationSectionNode >> usesToken: aSmaCCToken [
	usesToken := aSmaCCToken
]
