Class {
	#name : #DelphiVariantTypeNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'names',
		'commas',
		'colons',
		'left',
		'sections',
		'caseToken',
		'value',
		'type',
		'ofToken',
		'variantTypes',
		'semicolons',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiVariantTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariantType: self
]

{ #category : #generated }
DelphiVariantTypeNode >> caseToken [
	^ caseToken
]

{ #category : #generated }
DelphiVariantTypeNode >> caseToken: aSmaCCToken [
	caseToken := aSmaCCToken
]

{ #category : #generated }
DelphiVariantTypeNode >> colons [
	^ colons
]

{ #category : #generated }
DelphiVariantTypeNode >> colons: anOrderedCollection [
	colons := anOrderedCollection
]

{ #category : #generated }
DelphiVariantTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiVariantTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiVariantTypeNode >> compositeNodeVariables [
	^ #(#names #sections #variantTypes)
]

{ #category : #generated }
DelphiVariantTypeNode >> compositeTokenVariables [
	^ #(#colons)
]

{ #category : #generated }
DelphiVariantTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas #semicolons)
]

{ #category : #'generated-initialize-release' }
DelphiVariantTypeNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	colons := OrderedCollection new: 2.
	sections := OrderedCollection new: 2.
	variantTypes := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiVariantTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiVariantTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiVariantTypeNode >> names [
	^ names
]

{ #category : #generated }
DelphiVariantTypeNode >> names: anOrderedCollection [
	self setParents: self names to: nil.
	names := anOrderedCollection.
	self setParents: self names to: self
]

{ #category : #generated }
DelphiVariantTypeNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
DelphiVariantTypeNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
DelphiVariantTypeNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
DelphiVariantTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiVariantTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiVariantTypeNode >> sections [
	^ sections
]

{ #category : #generated }
DelphiVariantTypeNode >> sections: anOrderedCollection [
	self setParents: self sections to: nil.
	sections := anOrderedCollection.
	self setParents: self sections to: self
]

{ #category : #generated }
DelphiVariantTypeNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
DelphiVariantTypeNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]

{ #category : #generated }
DelphiVariantTypeNode >> tokenVariables [
	^ #(#left #caseToken #value #ofToken #right)
]

{ #category : #generated }
DelphiVariantTypeNode >> type [
	^ type
]

{ #category : #generated }
DelphiVariantTypeNode >> type: aDelphiProgramNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aDelphiProgramNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]

{ #category : #generated }
DelphiVariantTypeNode >> value [
	^ value
]

{ #category : #generated }
DelphiVariantTypeNode >> value: aSmaCCToken [
	value := aSmaCCToken
]

{ #category : #generated }
DelphiVariantTypeNode >> variantTypes [
	^ variantTypes
]

{ #category : #generated }
DelphiVariantTypeNode >> variantTypes: anOrderedCollection [
	self setParents: self variantTypes to: nil.
	variantTypes := anOrderedCollection.
	self setParents: self variantTypes to: self
]
