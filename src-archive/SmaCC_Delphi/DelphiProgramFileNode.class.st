Class {
	#name : #DelphiProgramFileNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'programToken',
		'programName',
		'modifier',
		'semicolons',
		'usesToken',
		'moduleNames',
		'inTokens',
		'filenames',
		'commas',
		'main',
		'period'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiProgramFileNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgramFile: self
]

{ #category : #generated }
DelphiProgramFileNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiProgramFileNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiProgramFileNode >> compositeNodeVariables [
	^ #(#moduleNames)
]

{ #category : #generated }
DelphiProgramFileNode >> compositeTokenVariables [
	^ #(#inTokens #filenames)
]

{ #category : #generated }
DelphiProgramFileNode >> filenames [
	^ filenames
]

{ #category : #generated }
DelphiProgramFileNode >> filenames: anOrderedCollection [
	filenames := anOrderedCollection
]

{ #category : #generated }
DelphiProgramFileNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons #commas)
]

{ #category : #generated }
DelphiProgramFileNode >> inTokens [
	^ inTokens
]

{ #category : #generated }
DelphiProgramFileNode >> inTokens: anOrderedCollection [
	inTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
DelphiProgramFileNode >> initialize [
	super initialize.
	semicolons := OrderedCollection new: 2.
	moduleNames := OrderedCollection new: 2.
	inTokens := OrderedCollection new: 2.
	filenames := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiProgramFileNode >> main [
	^ main
]

{ #category : #generated }
DelphiProgramFileNode >> main: aDelphiMainMethodDefinitionNode [
	self main notNil
		ifTrue: [ self main parent: nil ].
	main := aDelphiMainMethodDefinitionNode.
	self main notNil
		ifTrue: [ self main parent: self ]
]

{ #category : #generated }
DelphiProgramFileNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiProgramFileNode >> modifier: aSmaCCToken [
	modifier := aSmaCCToken
]

{ #category : #generated }
DelphiProgramFileNode >> moduleNames [
	^ moduleNames
]

{ #category : #generated }
DelphiProgramFileNode >> moduleNames: anOrderedCollection [
	self setParents: self moduleNames to: nil.
	moduleNames := anOrderedCollection.
	self setParents: self moduleNames to: self
]

{ #category : #generated }
DelphiProgramFileNode >> nodeVariables [
	^ #(#main)
]

{ #category : #generated }
DelphiProgramFileNode >> period [
	^ period
]

{ #category : #generated }
DelphiProgramFileNode >> period: aSmaCCToken [
	period := aSmaCCToken
]

{ #category : #generated }
DelphiProgramFileNode >> programName [
	^ programName
]

{ #category : #generated }
DelphiProgramFileNode >> programName: aSmaCCToken [
	programName := aSmaCCToken
]

{ #category : #generated }
DelphiProgramFileNode >> programToken [
	^ programToken
]

{ #category : #generated }
DelphiProgramFileNode >> programToken: aSmaCCToken [
	programToken := aSmaCCToken
]

{ #category : #generated }
DelphiProgramFileNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiProgramFileNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiProgramFileNode >> tokenVariables [
	^ #(#programToken #programName #modifier #usesToken #period)
]

{ #category : #generated }
DelphiProgramFileNode >> usesToken [
	^ usesToken
]

{ #category : #generated }
DelphiProgramFileNode >> usesToken: aSmaCCToken [
	usesToken := aSmaCCToken
]
