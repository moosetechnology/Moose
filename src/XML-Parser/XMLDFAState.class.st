"
This class is a DFA state made by grouping one or more NFA states.
"
Class {
	#name : #XMLDFAState,
	#superclass : #Object,
	#instVars : [
		'nfaStates',
		'dfaStateCache',
		'dfaStateTransitions',
		'hasNonDeterminism'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #'instance creation' }
XMLDFAState class >> nfaStates: anNFAStateSet [
	^ self
		nfaStates: anNFAStateSet
		dfaStateCache: nil
]

{ #category : #'instance creation' }
XMLDFAState class >> nfaStates: anNFAStateSet dfaStateCache: aDFAStateCache [
	^ self new
		setNFAStates: anNFAStateSet
		dfaStateCache: aDFAStateCache
]

{ #category : #private }
XMLDFAState >> addDFAStateTransitionMatching: aMatcher [
	| matchingNFAStates totalMatched matchingDFAState |

	self dfaStateTransitions size >= self maxDFAStateTransitions
		ifTrue: [self removeDFAStateTransitions].

	matchingNFAStates := XMLNFAStateSet new.
	totalMatched := 0.
	self nfaStatesDo: [:state |
		(state matches: aMatcher)
			ifTrue: [
				state nextState addTo: matchingNFAStates.
				totalMatched := totalMatched + 1]].

	matchingNFAStates size > 0
		ifTrue: [
			matchingDFAState :=
				dfaStateCache dfaStateForNFAStates: matchingNFAStates.
			totalMatched > 1
				ifTrue: [matchingDFAState hasNonDeterminism: true]].

	^ self dfaStateTransitions
		at: aMatcher
		put: matchingDFAState. "nil if no match"
]

{ #category : #private }
XMLDFAState >> dfaStateCache [
	^ dfaStateCache
]

{ #category : #private }
XMLDFAState >> dfaStateTransitions [
	^ dfaStateTransitions ifNil: [dfaStateTransitions := Dictionary new]
]

{ #category : #testing }
XMLDFAState >> hasNonDeterminism [
	^ hasNonDeterminism
]

{ #category : #accessing }
XMLDFAState >> hasNonDeterminism: aBoolean [
	hasNonDeterminism := aBoolean
]

{ #category : #testing }
XMLDFAState >> isAccepting [
	^ nfaStates isAccepting
]

{ #category : #private }
XMLDFAState >> maxDFAStateTransitions [
	^ 64
]

{ #category : #matching }
XMLDFAState >> nextDFAStateMatching: aMatcher [
	^ self
		nextDFAStateMatching: aMatcher
		ifNone: [nil]
]

{ #category : #matching }
XMLDFAState >> nextDFAStateMatching: aMatcher ifNone: aBlock [
	^ (self dfaStateTransitions
		at: aMatcher
		ifAbsent: [self addDFAStateTransitionMatching: aMatcher])
			ifNil: [aBlock value]
]

{ #category : #accessing }
XMLDFAState >> nfaStates [
	^ nfaStates
]

{ #category : #enumerating }
XMLDFAState >> nfaStatesDo: aBlock [
	nfaStates do: aBlock
]

{ #category : #printing }
XMLDFAState >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self nfaStates;
		nextPut: $).
]

{ #category : #private }
XMLDFAState >> removeDFAStateTransitions [
	dfaStateTransitions := nil
]

{ #category : #initialization }
XMLDFAState >> setNFAStates: anNFAStateSet dfaStateCache: aDFAStateCache [
	nfaStates := anNFAStateSet.
	dfaStateCache :=
		aDFAStateCache	
			ifNil: [XMLDFAStateCache firstDFAState: self].
	hasNonDeterminism := false.
]
