"
PetitParser Refactoring: renaming of a production rule.
"
Class {
	#name : #PPRenameProdcutionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'oldProduction',
		'newProduction',
		'class'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPRenameProdcutionRefactoring class >> onClass: aClass rename: anOldSelector to: aNewSelector [
	^ self new
		setClass: aClass;
		setOldProduction: anOldSelector;
		setNewProduction: aNewSelector;
		yourself
]

{ #category : #preconditions }
PPRenameProdcutionRefactoring >> preconditions [
	^ self checkCompositeParser: class
]

{ #category : #initialization }
PPRenameProdcutionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PPRenameProdcutionRefactoring >> setNewProduction: aSymbol [
	newProduction := aSymbol
]

{ #category : #initialization }
PPRenameProdcutionRefactoring >> setOldProduction: aSymbol [
	oldProduction := aSymbol
]

{ #category : #transforming }
PPRenameProdcutionRefactoring >> transform [
	| baseClass oldEnvironment |
	baseClass := class whoDefinesInstanceVariable: oldProduction asString.
	self performComponentRefactoring: (RBRenameInstanceVariableRefactoring
		model: model
		rename: oldProduction asString
		to: newProduction asString
		in: baseClass
		renameAccessors: false).
	oldEnvironment := model environment.
	model environment: (model environment
		forClasses: baseClass realClass withAllSubclasses).
	[ self performComponentRefactoring: (RBRenameMethodRefactoring
		model: model
		renameMethod: oldProduction asSymbol
		in: baseClass
		to: newProduction asSymbol 
		permutation: #()) ]
			ensure: [ model environment: oldEnvironment ]
]
