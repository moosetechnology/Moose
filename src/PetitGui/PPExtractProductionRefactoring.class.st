"
PetitParser Refactoring: extraction of a production rule
"
Class {
	#name : #PPExtractProductionRefactoring,
	#superclass : #RBExtractMethodRefactoring,
	#instVars : [
		'targetProduction'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPExtractProductionRefactoring class >> onClass: aClass production: aSelector interval: anInterval to: aTargetSelector [
	^ (self extract: anInterval from: aSelector in: aClass)
		setTargetProduction: aTargetSelector;
		yourself
]

{ #category : #transforming }
PPExtractProductionRefactoring >> existingSelector [
	^ nil
]

{ #category : #transforming }
PPExtractProductionRefactoring >> getNewMethodName [
	parameters isEmpty
		ifFalse: [ self refactoringError: 'Cannot extract production since it contains references.' ].
	targetProduction asSymbol isUnary
		ifFalse: [ self refactoringError: 'Invalid production name.' ].
	^ targetProduction asSymbol
]

{ #category : #transforming }
PPExtractProductionRefactoring >> nameNewMethod: aSymbol [ 
	class addInstanceVariable: aSymbol asString.
	extractedParseTree renameSelector: aSymbol andArguments: #().
	modifiedParseTree := RBParseTreeRewriter 
		replace: self methodDelimiter
		with: aSymbol asString
		in: modifiedParseTree
]

{ #category : #preconditions }
PPExtractProductionRefactoring >> preconditions [
	^ (self checkCompositeParser: class)
		& super preconditions		
		& (RBCondition definesSelector: targetProduction asSymbol in: class) not
		& (RBCondition definesInstanceVariable: targetProduction asString in: class) not
]

{ #category : #initialization }
PPExtractProductionRefactoring >> setTargetProduction: aSymbol [
	targetProduction := aSymbol
]

{ #category : #requests }
PPExtractProductionRefactoring >> shouldExtractAssignmentTo: aString [
	^ false
]
