Class {
	#name : #DudeWhiteSpaceCleanerTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Text'
}

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanAllNoises [
	| aText cleanedText cr lf spc tab |
	cr := String with: Character cr.
	lf := String with: Character lf.
	spc := String with: Character space.
	tab := String with: Character tab.
	aText := OrderedCollection new.
	aText add: tab , tab , 'as' , lf , cr , tab , 'df' , spc , lf.
	aText add: lf , lf , lf , cr , cr , cr , tab , tab , spc , spc , 'd' , cr , cr , 'fgf'.
	cleanedText := DudeWhiteSpaceCleaner new specificClean: aText.
	self assert: (cleanedText at: 1) equals: 'asdf'.
	self assert: (cleanedText at: 2) equals: 'dfgf'
]

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanCRLF [
	| aText cleanedText noise |
	noise := String with: Character cr with: Character lf.
	aText := OrderedCollection new.
	aText add: 'as' , noise , 'df' , noise.
	aText add: noise , 'dfgf'.
	cleanedText := DudeWhiteSpaceCleaner new specificClean: aText.
	self assert: (cleanedText at: 1) equals: 'asdf'.
	self assert: (cleanedText at: 2) equals: 'dfgf'
]

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanOneCR [
	| aText cleanedText CR |
	CR := String with: Character cr.
	aText := OrderedCollection new.
	aText add: 'as' , CR , 'df'.
	aText add: 'dfgf'.
	cleanedText := DudeWhiteSpaceCleaner new specificClean: aText.
	self assert: (cleanedText at: 1) equals: 'asdf'.
	self assert: (cleanedText at: 2) equals: 'dfgf'
]

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanOneLF [
	| aText cleanedText LF |
	LF := String with: Character lf.
	aText := OrderedCollection new.
	aText add: 'as' , LF , 'df'.
	aText add: 'dfgf'.
	cleanedText := DudeWhiteSpaceCleaner new specificClean: aText.
	self assert: (cleanedText at: 1) equals: 'asdf'.
	self assert: (cleanedText at: 2) equals: 'dfgf'
]

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanOneSpace [
	| aText |
	aText := OrderedCollection new.
	aText add: 'asdf'.
	aText add: 'df gf'.
	self assert: ((DudeWhiteSpaceCleaner new specificClean: aText) at: 2) equals: 'dfgf'
]

{ #category : #testing }
DudeWhiteSpaceCleanerTest >> testCleanOneTab [
	| aText cleanedText |
	aText := OrderedCollection new.
	aText add: 'as	df'.
	aText add: 'dfgf'.
	cleanedText := DudeWhiteSpaceCleaner new specificClean: aText.
	self assert: (cleanedText at: 1) equals: 'asdf'.
	self assert: (cleanedText at: 2) equals: 'dfgf'
]
