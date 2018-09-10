Class {
	#name : #DelphiMethodHeaderNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'attribute',
		'qualifiedName',
		'left',
		'right',
		'modifiers'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMethodHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethodHeader: self
]

{ #category : #generated }
DelphiMethodHeaderNode >> attribute [
	^ attribute
]

{ #category : #generated }
DelphiMethodHeaderNode >> attribute: aDelphiMethodAttributeNode [
	self attribute notNil
		ifTrue: [ self attribute parent: nil ].
	attribute := aDelphiMethodAttributeNode.
	self attribute notNil
		ifTrue: [ self attribute parent: self ]
]

{ #category : #generated }
DelphiMethodHeaderNode >> compositeNodeVariables [
	^ #(#modifiers)
]

{ #category : #'generated-initialize-release' }
DelphiMethodHeaderNode >> initialize [
	super initialize.
	modifiers := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMethodHeaderNode >> left [
	^ left
]

{ #category : #generated }
DelphiMethodHeaderNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiMethodHeaderNode >> modifiers [
	^ modifiers
]

{ #category : #generated }
DelphiMethodHeaderNode >> modifiers: anOrderedCollection [
	self setParents: self modifiers to: nil.
	modifiers := anOrderedCollection.
	self setParents: self modifiers to: self
]

{ #category : #generated }
DelphiMethodHeaderNode >> nodeVariables [
	^ #(#attribute #qualifiedName)
]

{ #category : #generated }
DelphiMethodHeaderNode >> qualifiedName [
	^ qualifiedName
]

{ #category : #generated }
DelphiMethodHeaderNode >> qualifiedName: aDelphiQualifiedNameNode [
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: nil ].
	qualifiedName := aDelphiQualifiedNameNode.
	self qualifiedName notNil
		ifTrue: [ self qualifiedName parent: self ]
]

{ #category : #generated }
DelphiMethodHeaderNode >> right [
	^ right
]

{ #category : #generated }
DelphiMethodHeaderNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiMethodHeaderNode >> tokenVariables [
	^ #(#left #right)
]
