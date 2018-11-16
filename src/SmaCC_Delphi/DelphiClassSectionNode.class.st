Class {
	#name : #DelphiClassSectionNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'components'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitClassSection: self
]

{ #category : #generated }
DelphiClassSectionNode >> components [
	^ components
]

{ #category : #generated }
DelphiClassSectionNode >> components: anOrderedCollection [
	self setParents: self components to: nil.
	components := anOrderedCollection.
	self setParents: self components to: self
]

{ #category : #generated }
DelphiClassSectionNode >> compositeNodeVariables [
	^ #(#components)
]

{ #category : #'generated-initialize-release' }
DelphiClassSectionNode >> initialize [
	super initialize.
	components := OrderedCollection new: 2.
]
