Class {
	#name : #DelphiRecordTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'packedToken',
		'recordToken',
		'sections',
		'caseToken',
		'value',
		'colon',
		'type',
		'ofToken',
		'variantTypes',
		'semicolons',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiRecordTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitRecordType: self
]

{ #category : #generated }
DelphiRecordTypeNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
DelphiRecordTypeNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> colon [
	^ colon
]

{ #category : #generated }
DelphiRecordTypeNode >> colon: aSmaCCToken [
	colon := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> compositeNodeVariables [
	^ #(#sections #variantTypes)
]

{ #category : #generated }
DelphiRecordTypeNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiRecordTypeNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiRecordTypeNode >> initialize [
	super initialize.
	sections := OrderedCollection new: 2.
	variantTypes := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiRecordTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiRecordTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiRecordTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> packedToken [
	^ packedToken
]

{ #category : #generated }
DelphiRecordTypeNode >> packedToken: aSmaCCToken [
	packedToken := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> recordToken [
	^ recordToken
]

{ #category : #generated }
DelphiRecordTypeNode >> recordToken: aSmaCCToken [
	recordToken := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> sections [
	^ sections
]

{ #category : #generated }
DelphiRecordTypeNode >> sections: anOrderedCollection [
	self setParents: self sections to: nil.
	sections := anOrderedCollection.
	self setParents: self sections to: self
]

{ #category : #generated }
DelphiRecordTypeNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiRecordTypeNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiRecordTypeNode >> tokenVariables [
	^ #(#packedToken #recordToken #caseToken #value #colon #ofToken #endToken)
]

{ #category : #generated }
DelphiRecordTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiRecordTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiRecordTypeNode >> value [
	^ value
]

{ #category : #generated }
DelphiRecordTypeNode >> value: aSmaCCToken [
	value := aSmaCCToken
]

{ #category : #generated }
DelphiRecordTypeNode >> variantTypes [
	^ variantTypes
]

{ #category : #generated }
DelphiRecordTypeNode >> variantTypes: anOrderedCollection [
	self setParents: self variantTypes to: nil.
	variantTypes := anOrderedCollection.
	self setParents: self variantTypes to: self
]
