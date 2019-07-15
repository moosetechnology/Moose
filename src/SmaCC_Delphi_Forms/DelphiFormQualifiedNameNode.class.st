Class {
	#name : #DelphiFormQualifiedNameNode,
	#superclass : #DelphiFormParseNode,
	#instVars : [
		'names',
		'periods'
	],
	#category : #'SmaCC_Delphi_Forms'
}

{ #category : #generated }
DelphiFormQualifiedNameNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitQualifiedName: self
]

{ #category : #generated }
DelphiFormQualifiedNameNode >> compositeTokenVariables [
	^ #(#names #periods)
]

{ #category : #'generated-initialize-release' }
DelphiFormQualifiedNameNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	periods := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiFormQualifiedNameNode >> names [
	^ names
]

{ #category : #generated }
DelphiFormQualifiedNameNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
DelphiFormQualifiedNameNode >> periods [
	^ periods
]

{ #category : #generated }
DelphiFormQualifiedNameNode >> periods: anOrderedCollection [
	periods := anOrderedCollection
]
