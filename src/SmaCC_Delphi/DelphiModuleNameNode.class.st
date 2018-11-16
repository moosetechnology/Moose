Class {
	#name : #DelphiModuleNameNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'names',
		'periods'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiModuleNameNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModuleName: self
]

{ #category : #generated }
DelphiModuleNameNode >> compositeTokenVariables [
	^ #(#names #periods)
]

{ #category : #'generated-initialize-release' }
DelphiModuleNameNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	periods := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiModuleNameNode >> names [
	^ names
]

{ #category : #generated }
DelphiModuleNameNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiModuleNameNode >> periods [
	^ periods
]

{ #category : #generated }
DelphiModuleNameNode >> periods: anOrderedCollection [
	periods := anOrderedCollection
]
