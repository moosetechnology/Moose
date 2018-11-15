"
Abstract parser that parses a list of things in some way (to be specified by the subclasses).

Instance Variables:
	parsers	<SequenceableCollection of: PPParser>	A sequence of other parsers to delegate to.

"
Class {
	#name : #PPListParser,
	#superclass : #PPParser,
	#instVars : [
		'parsers'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPListParser class >> with: aParser [
	^ self withAll: (Array with: aParser)
]

{ #category : #'instance creation' }
PPListParser class >> with: aFirstParser with: aSecondParser [
	^ self withAll: (Array with: aFirstParser with: aSecondParser)
]

{ #category : #'instance creation' }
PPListParser class >> withAll: aCollection [
	^ self basicNew initialize;
		setParsers: aCollection
]

{ #category : #accessing }
PPListParser >> children [
	^ parsers
]

{ #category : #copying }
PPListParser >> copyWith: aParser [
	^ self species withAll: (parsers copyWith: aParser)
]

{ #category : #initialization }
PPListParser >> initialize [
	super initialize.
	self setParsers: #()
]

{ #category : #copying }
PPListParser >> postCopy [
	super postCopy.
	parsers := parsers copy
]

{ #category : #initialization }
PPListParser >> setParsers: aCollection [
	parsers := aCollection asArray
]
