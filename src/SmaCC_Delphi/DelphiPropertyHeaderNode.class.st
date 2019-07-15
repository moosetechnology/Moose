Class {
	#name : #DelphiPropertyHeaderNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'propertyToken',
		'name',
		'arrayAccessors',
		'colon',
		'type',
		'indexes',
		'readers',
		'writers',
		'defaults',
		'storeds',
		'implementses',
		'dispids',
		'semicolon',
		'modifier'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyHeaderNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyHeader: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> arrayAccessors [
	^ arrayAccessors
]

{ #category : #generated }
DelphiPropertyHeaderNode >> arrayAccessors: aDelphiPropertyArrayAccessorsNode [
	self arrayAccessors notNil
		ifTrue: [ self arrayAccessors parent: nil ].
	arrayAccessors := aDelphiPropertyArrayAccessorsNode.
	self arrayAccessors notNil
		ifTrue: [ self arrayAccessors parent: self ]
]

{ #category : #generated }
DelphiPropertyHeaderNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiPropertyHeaderNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyHeaderNode >> compositeNodeVariables [
	^ #(#indexes #readers #writers #defaults #storeds #implementses #dispids)
]

{ #category : #generated }
DelphiPropertyHeaderNode >> defaults [
	^ defaults
]

{ #category : #generated }
DelphiPropertyHeaderNode >> defaults: anOrderedCollection [
	self setParents: self defaults to: nil.
	defaults := anOrderedCollection.
	self setParents: self defaults to: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> dispids [
	^ dispids
]

{ #category : #generated }
DelphiPropertyHeaderNode >> dispids: anOrderedCollection [
	self setParents: self dispids to: nil.
	dispids := anOrderedCollection.
	self setParents: self dispids to: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiPropertyHeaderNode >> implementses [
	^ implementses
]

{ #category : #generated }
DelphiPropertyHeaderNode >> implementses: anOrderedCollection [
	self setParents: self implementses to: nil.
	implementses := anOrderedCollection.
	self setParents: self implementses to: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> indexes [
	^ indexes
]

{ #category : #generated }
DelphiPropertyHeaderNode >> indexes: anOrderedCollection [
	self setParents: self indexes to: nil.
	indexes := anOrderedCollection.
	self setParents: self indexes to: self
]

{ #category : #'generated-initialize-release' }
DelphiPropertyHeaderNode >> initialize [
	super initialize.
	indexes := OrderedCollection new: 2.
	readers := OrderedCollection new: 2.
	writers := OrderedCollection new: 2.
	defaults := OrderedCollection new: 2.
	storeds := OrderedCollection new: 2.
	implementses := OrderedCollection new: 2.
	dispids := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiPropertyHeaderNode >> modifier [
	^ modifier
]

{ #category : #generated }
DelphiPropertyHeaderNode >> modifier: aDelphiPropertyModifierNode [
	self modifier notNil
		ifTrue: [ self modifier parent: nil ].
	modifier := aDelphiPropertyModifierNode.
	self modifier notNil
		ifTrue: [ self modifier parent: self ]
]

{ #category : #generated }
DelphiPropertyHeaderNode >> name [
	^ name
]

{ #category : #generated }
DelphiPropertyHeaderNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyHeaderNode >> nodeVariables [
	^ #(#arrayAccessors #type #modifier)
]

{ #category : #generated }
DelphiPropertyHeaderNode >> propertyToken [
	^ propertyToken
]

{ #category : #generated }
DelphiPropertyHeaderNode >> propertyToken: aSmaCCToken [
	propertyToken := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyHeaderNode >> readers [
	^ readers
]

{ #category : #generated }
DelphiPropertyHeaderNode >> readers: anOrderedCollection [
	self setParents: self readers to: nil.
	readers := anOrderedCollection.
	self setParents: self readers to: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiPropertyHeaderNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiPropertyHeaderNode >> storeds [
	^ storeds
]

{ #category : #generated }
DelphiPropertyHeaderNode >> storeds: anOrderedCollection [
	self setParents: self storeds to: nil.
	storeds := anOrderedCollection.
	self setParents: self storeds to: self
]

{ #category : #generated }
DelphiPropertyHeaderNode >> tokenVariables [
	^ #(#propertyToken #name #colon)
]

{ #category : #generated }
DelphiPropertyHeaderNode >> type [
	^ type
]

{ #category : #generated }
DelphiPropertyHeaderNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiPropertyHeaderNode >> writers [
	^ writers
]

{ #category : #generated }
DelphiPropertyHeaderNode >> writers: anOrderedCollection [
	self setParents: self writers to: nil.
	writers := anOrderedCollection.
	self setParents: self writers to: self
]
