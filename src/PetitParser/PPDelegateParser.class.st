"
A parser that delegates to another parser.

Instance Variables:
	parser	<PPParser>	The parser to delegate to.
"
Class {
	#name : #PPDelegateParser,
	#superclass : #PPParser,
	#instVars : [
		'parser'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPDelegateParser class >> on: aParser [
	^ self new setParser: aParser
]

{ #category : #accessing }
PPDelegateParser >> children [
	^ Array with: parser
]

{ #category : #parsing }
PPDelegateParser >> parseOn: aPPContext [
	^ parser parseOn: aPPContext
]

{ #category : #initialization }
PPDelegateParser >> setParser: aParser [
	parser := aParser
]
