"
PetitParser Refactoring: removal of a parser
"
Class {
	#name : #PPRemoveParserRefactoring,
	#superclass : #RBRemoveClassRefactoring,
	#instVars : [
		'class'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPRemoveParserRefactoring class >> onClass: aClass [
	^ self new
		setClass: aClass;
		yourself
]

{ #category : #preconditions }
PPRemoveParserRefactoring >> preconditions [
	^ (self checkCompositeParser: class) & (RBCondition hasSubclasses: class) not
]

{ #category : #initialization }
PPRemoveParserRefactoring >> setClass: aClass [
	class := self classObjectFor: aClass
]

{ #category : #transforming }
PPRemoveParserRefactoring >> transform [
	model removeClass: class
]
