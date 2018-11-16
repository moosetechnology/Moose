Class {
	#name : #DelphiPropertyImplementsNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'implementsToken',
		'interfaces',
		'commas'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPropertyImplementsNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPropertyImplements: self
]

{ #category : #generated }
DelphiPropertyImplementsNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiPropertyImplementsNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiPropertyImplementsNode >> compositeTokenVariables [
	^ #(#interfaces)
]

{ #category : #generated }
DelphiPropertyImplementsNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #generated }
DelphiPropertyImplementsNode >> implementsToken [
	^ implementsToken
]

{ #category : #generated }
DelphiPropertyImplementsNode >> implementsToken: aSmaCCToken [
	implementsToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
DelphiPropertyImplementsNode >> initialize [
	super initialize.
	interfaces := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiPropertyImplementsNode >> interfaces [
	^ interfaces
]

{ #category : #generated }
DelphiPropertyImplementsNode >> interfaces: anOrderedCollection [
	interfaces := anOrderedCollection
]

{ #category : #generated }
DelphiPropertyImplementsNode >> tokenVariables [
	^ #(#implementsToken)
]
