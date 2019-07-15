Class {
	#name : #DelphiInheritedFunctionCallNode,
	#superclass : #DelphiExpressionNode,
	#instVars : [
		'inheritedToken',
		'name',
		'left',
		'arguments',
		'commas',
		'right'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiInheritedFunctionCallNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitInheritedFunctionCall: self
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> commas [
	^ commas
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> inheritedToken [
	^ inheritedToken
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> inheritedToken: aSmaCCToken [
	inheritedToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
DelphiInheritedFunctionCallNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> left [
	^ left
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> name [
	^ name
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> right [
	^ right
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
DelphiInheritedFunctionCallNode >> tokenVariables [
	^ #(#inheritedToken #name #left #right)
]
