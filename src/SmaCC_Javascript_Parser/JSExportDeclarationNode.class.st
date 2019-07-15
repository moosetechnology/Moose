Class {
	#name : #JSExportDeclarationNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'exportToken',
		'star',
		'fromToken',
		'from',
		'semicolon',
		'leftBrace',
		'rightBrace',
		'specifiers',
		'commas',
		'statement',
		'declaration',
		'defaultToken'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSExportDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExportDeclaration: self
]

{ #category : #generated }
JSExportDeclarationNode >> commas [
	^ commas
]

{ #category : #generated }
JSExportDeclarationNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSExportDeclarationNode >> compositeNodeVariables [
	^ #(#specifiers)
]

{ #category : #generated }
JSExportDeclarationNode >> declaration [
	^ declaration
]

{ #category : #generated }
JSExportDeclarationNode >> declaration: aJSProgramNode [
	self declaration notNil
		ifTrue: [ self declaration parent: nil ].
	declaration := aJSProgramNode.
	self declaration notNil
		ifTrue: [ self declaration parent: self ]
]

{ #category : #generated }
JSExportDeclarationNode >> defaultToken [
	^ defaultToken
]

{ #category : #generated }
JSExportDeclarationNode >> defaultToken: aSmaCCToken [
	defaultToken := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> exportToken [
	^ exportToken
]

{ #category : #generated }
JSExportDeclarationNode >> exportToken: aSmaCCToken [
	exportToken := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> from [
	^ from
]

{ #category : #generated }
JSExportDeclarationNode >> from: aSmaCCToken [
	from := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> fromToken [
	^ fromToken
]

{ #category : #generated }
JSExportDeclarationNode >> fromToken: aSmaCCToken [
	fromToken := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
JSExportDeclarationNode >> ignoredTokenVariables [
	^ #(#semicolon #leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSExportDeclarationNode >> initialize [
	super initialize.
	specifiers := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSExportDeclarationNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSExportDeclarationNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> nodeVariables [
	^ #(#statement #declaration)
]

{ #category : #generated }
JSExportDeclarationNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSExportDeclarationNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSExportDeclarationNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> specifiers [
	^ specifiers
]

{ #category : #generated }
JSExportDeclarationNode >> specifiers: anOrderedCollection [
	self setParents: self specifiers to: nil.
	specifiers := anOrderedCollection.
	self setParents: self specifiers to: self
]

{ #category : #generated }
JSExportDeclarationNode >> star [
	^ star
]

{ #category : #generated }
JSExportDeclarationNode >> star: aSmaCCToken [
	star := aSmaCCToken
]

{ #category : #generated }
JSExportDeclarationNode >> statement [
	^ statement
]

{ #category : #generated }
JSExportDeclarationNode >> statement: aJSProgramNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSProgramNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSExportDeclarationNode >> tokenVariables [
	^ #(#exportToken #star #fromToken #from #defaultToken)
]
