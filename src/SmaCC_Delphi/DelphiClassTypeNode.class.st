Class {
	#name : #DelphiClassTypeNode,
	#superclass : #DelphiClassOrInterfaceTypeNode,
	#instVars : [
		'implicitClassSection',
		'sections'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassType: self
]

{ #category : #generated }
DelphiClassTypeNode >> compositeNodeVariables [
	^ #(#sections #superclasses)
]

{ #category : #generated }
DelphiClassTypeNode >> implicitClassSection [
	^ implicitClassSection
]

{ #category : #generated }
DelphiClassTypeNode >> implicitClassSection: aDelphiImplicitClassSectionNode [
	self implicitClassSection notNil
		ifTrue: [ self implicitClassSection parent: nil ].
	implicitClassSection := aDelphiImplicitClassSectionNode.
	self implicitClassSection notNil
		ifTrue: [ self implicitClassSection parent: self ]
]

{ #category : #'generated-initialize-release' }
DelphiClassTypeNode >> initialize [
	super initialize.
	sections := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiClassTypeNode >> nodeVariables [
	^ #(#implicitClassSection)
]

{ #category : #generated }
DelphiClassTypeNode >> sections [
	^ sections
]

{ #category : #generated }
DelphiClassTypeNode >> sections: anOrderedCollection [
	self setParents: self sections to: nil.
	sections := anOrderedCollection.
	self setParents: self sections to: self
]
