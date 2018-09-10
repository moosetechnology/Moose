"
PetitParser Refactoring: addition of a parser
"
Class {
	#name : #PPAddParserRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'superclass',
		'name',
		'cateogry'
	],
	#category : #'PetitGui-Refactoring'
}

{ #category : #'instance creation' }
PPAddParserRefactoring class >> name: aString category: aSymbol [
	^ self name: aString category: aSymbol superclass: PPCompositeParser
]

{ #category : #'instance creation' }
PPAddParserRefactoring class >> name: aString category: aSymbol superclass: aClass [
	^ self new
		setName: aString;
		setCategory: aSymbol;
		setSuperclass: aClass;
		yourself
]

{ #category : #preconditions }
PPAddParserRefactoring >> preconditions [
	^ self checkCompositeParser: superclass
]

{ #category : #initialization }
PPAddParserRefactoring >> setCategory: aSymbol [
	cateogry := aSymbol asSymbol
]

{ #category : #initialization }
PPAddParserRefactoring >> setName: aString [
	name := aString
]

{ #category : #initialization }
PPAddParserRefactoring >> setSuperclass: aClass [
	superclass := self classObjectFor: aClass
]

{ #category : #accessing }
PPAddParserRefactoring >> startProductionSource [
	^ 'start
	^ self shouldBeImplemented'
]

{ #category : #transforming }
PPAddParserRefactoring >> transform [
	self performComponentRefactoring: (RBAddClassRefactoring
		model: self model
		addClass: name
		superclass: superclass
		subclasses: #()
		category: cateogry).
	(self classObjectFor: name)
		compile: self startProductionSource
		classified: #(accessing)
]
