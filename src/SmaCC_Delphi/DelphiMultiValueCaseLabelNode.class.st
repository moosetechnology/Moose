Class {
	#name : #DelphiMultiValueCaseLabelNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'labels',
		'commas'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMultiValueCaseLabel: self
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> compositeNodeVariables [
	^ #(#labels)
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> ignoredCompositeTokenVariables [
	^ #(#commas)
]

{ #category : #'generated-initialize-release' }
DelphiMultiValueCaseLabelNode >> initialize [
	super initialize.
	labels := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> labels [
	^ labels
]

{ #category : #generated }
DelphiMultiValueCaseLabelNode >> labels: anOrderedCollection [
	self setParents: self labels to: nil.
	labels := anOrderedCollection.
	self setParents: self labels to: self
]
