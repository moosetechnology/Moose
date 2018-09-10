"
This is a base class for NFA states.
"
Class {
	#name : #XMLNFAState,
	#superclass : #Object,
	#instVars : [
		'lastAddedTo'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #adding }
XMLNFAState >> addTo: aStateSet [
	lastAddedTo == aStateSet
		ifFalse: [
			"to detect and handle cycles"
			lastAddedTo := aStateSet.

			aStateSet add: self]
]

{ #category : #converting }
XMLNFAState >> asDFAState [
	| nfaStates |

	nfaStates := XMLNFAStateSet new.
	self addTo: nfaStates.
	^ nfaStates asDFAState.
]

{ #category : #connecting }
XMLNFAState >> connectToState: aState [
]

{ #category : #testing }
XMLNFAState >> isAccepting [
	^ false
]

{ #category : #testing }
XMLNFAState >> matches: anObject [
	^ false
]

{ #category : #enumerating }
XMLNFAState >> nextStatesDo: aBlock [
]

{ #category : #printing }
XMLNFAState >> printLabelOn: aStream [
	aStream print: self identityHash
]
