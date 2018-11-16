Class {
	#name : #DelphiClassOrInterfaceTypeNode,
	#superclass : #DelphiTypeNode,
	#instVars : [
		'left',
		'superclasses',
		'commas',
		'right',
		'endToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassOrInterfaceType: self
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> compositeNodeVariables [
	^ #(#superclasses)
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> endToken [
	^ endToken
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> endToken: aSmaCCToken [
	endToken := aSmaCCToken
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiClassOrInterfaceTypeNode >> initialize [
	super initialize.
	superclasses := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> left [
	^ left
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> right [
	^ right
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> superclasses [
	^ superclasses
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> superclasses: anOrderedCollection [
	self setParents: self superclasses to: nil.
	superclasses := anOrderedCollection.
	self setParents: self superclasses to: self
]

{ #category : #generated }
DelphiClassOrInterfaceTypeNode >> tokenVariables [
	^ #(#left #right #endToken)
]
