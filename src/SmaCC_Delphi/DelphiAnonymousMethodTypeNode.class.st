Class {
	#name : #DelphiAnonymousMethodTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'left',
		'arguments',
		'semicolons',
		'right',
		'ofToken',
		'objectToken',
		'modifiers'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAnonymousMethodType: self
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> compositeNodeVariables [
	^ #(#arguments #modifiers)
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiAnonymousMethodTypeNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> objectToken [
	^ objectToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> objectToken: aSmaCCToken [
	objectToken := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiAnonymousMethodTypeNode >> tokenVariables [
	^ #(#left #right #ofToken #objectToken)
]
