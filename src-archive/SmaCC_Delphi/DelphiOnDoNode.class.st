Class {
	#name : #DelphiOnDoNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'onToken',
		'exception',
		'colon',
		'type',
		'doToken',
		'statements',
		'semicolons'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiOnDoNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitOnDo: self
]

{ #category : #generated }
DelphiOnDoNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiOnDoNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiOnDoNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
DelphiOnDoNode >> doToken [
	^ doToken
]

{ #category : #generated }
DelphiOnDoNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
DelphiOnDoNode >> exception [
	^ exception
]

{ #category : #generated }
DelphiOnDoNode >> exception: aDelphiQualifiedNameNode [
	self exception notNil
		ifTrue: [ self exception parent: nil ].
	exception := aDelphiQualifiedNameNode.
	self exception notNil
		ifTrue: [ self exception parent: self ]
]

{ #category : #generated }
DelphiOnDoNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiOnDoNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiOnDoNode >> nodeVariables [
	^ #(#exception #type)
]

{ #category : #generated }
DelphiOnDoNode >> onToken [
	^ onToken
]

{ #category : #generated }
DelphiOnDoNode >> onToken: aSmaCCToken [
	onToken := aSmaCCToken
]

{ #category : #generated }
DelphiOnDoNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiOnDoNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiOnDoNode >> statements [
	^ statements
]

{ #category : #generated }
DelphiOnDoNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
DelphiOnDoNode >> tokenVariables [
	^ #(#onToken #colon #doToken)
]

{ #category : #generated }
DelphiOnDoNode >> type [
	^ type
]

{ #category : #generated }
DelphiOnDoNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
