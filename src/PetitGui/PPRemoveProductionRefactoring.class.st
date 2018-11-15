"
PetitParser Refactoring: removal of a production rule
"
Class {
	#name : #PPRemoveProductionRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'production',
		'class'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPRemoveProductionRefactoring class >> onClass: aClass production: aSelector [
	^ self new
		setClass: aClass;
		setProduction: aSelector;
		yourself
]

{ #category : #preconditions }
PPRemoveProductionRefactoring >> preconditions [
	^ (self checkCompositeParser: class)
		& (RBCondition definesSelector: production asSymbol in: class)
		& (RBCondition definesInstanceVariable: production asString in: class)
]

{ #category : #initialization }
PPRemoveProductionRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #initialization }
PPRemoveProductionRefactoring >> setProduction: aSymbol [
	production := aSymbol
]

{ #category : #transforming }
PPRemoveProductionRefactoring >> transform [
	class removeMethod: production asSymbol.
	class removeInstanceVariable: production asString
]
