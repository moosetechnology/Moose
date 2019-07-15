"
This class validates elements using a regular expression converted to a DFA. It ignores PCDATA, comments, and PIs.
"
Class {
	#name : #XMLDFAElementValidator,
	#superclass : #XMLElementValidator,
	#instVars : [
		'dfa',
		'currentState'
	],
	#category : #'XML-Parser-Validation'
}

{ #category : #'instance creation' }
XMLDFAElementValidator class >> element: anElement dfa: aDFA [
	^ self new
		setElement: anElement
		dfa: aDFA
]

{ #category : #converting }
XMLDFAElementValidator >> asReadyElementValidator [
	^ self copy
]

{ #category : #testing }
XMLDFAElementValidator >> atEnd [
	^ currentState isAccepting
]

{ #category : #accessing }
XMLDFAElementValidator >> currentState [
	^ currentState
]

{ #category : #accessing }
XMLDFAElementValidator >> dfa [
	^ dfa
]

{ #category : #private }
XMLDFAElementValidator >> errorNonDeterminismInContentModelAfter: anElement [
	XMLValidationException
		formatSignal:
			'Content model for <{1}> becomes non-deterministic after <{2}>. ',
			'Rewrite it deterministically; for example "{3}" instead ',
			'of "{4}"'
		with: self element
		with: anElement
		with: '(a,(b|c))'
		with: '((a,b)|(a,c))'
]

{ #category : #copying }
XMLDFAElementValidator >> postCopy [
	currentState := dfa
]

{ #category : #initialization }
XMLDFAElementValidator >> setElement: anElement dfa: aDFA [
	element := anElement.
	dfa := aDFA.
	currentState := aDFA.
]

{ #category : #validating }
XMLDFAElementValidator >> validateStartTag: anElement [
	currentState :=
		currentState
			nextDFAStateMatching: anElement
			ifNone: [self errorUnexpectedElement: anElement].
	currentState hasNonDeterminism
		ifTrue: [self errorNonDeterminismInContentModelAfter: anElement].
]
