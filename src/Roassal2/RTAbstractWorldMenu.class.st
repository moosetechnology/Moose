"
Abstract class that can be used to produce a new set of Menu entries. See class side
"
Class {
	#name : #RTAbstractWorldMenu,
	#superclass : #RTObject,
	#category : #'Roassal2-MorphSpecific-Menu'
}

{ #category : #public }
RTAbstractWorldMenu class >> createNewSetOfMenuEntriesForInitials: initialLetters classCategory: aCategory [
	"
	Allow to create the World menu entry for a given project
	
	self new createNewSetOfMenuEntriesForInitials: 'CA' classCategory: 'DataStudio-WorldMenu'
	"
	
	| superclassName |
	self assert: [ initialLetters isString ].
	superclassName := (initialLetters, 'AbstractWorldMenu') asSymbol.
	Object subclass: superclassName instanceVariableNames: ''
		classVariableNames: '' category: aCategory.
		
	superclassName subclass: (initialLetters, 'About') asSymbol instanceVariableNames: ''
		classVariableNames: '' category: aCategory.
	
	superclassName subclass: (initialLetters, 'ChatWithUs') asSymbol instanceVariableNames: ''
		classVariableNames: '' category: aCategory.

	superclassName subclass: (initialLetters, 'HowToReportABug') asSymbol instanceVariableNames: ''
		classVariableNames: '' category: aCategory.
]

{ #category : #'world menu' }
RTAbstractWorldMenu class >> projectName [
	^ 'Roassal'
]
