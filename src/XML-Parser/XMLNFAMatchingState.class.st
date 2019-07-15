"
This state can pass to a next state if the input matches against an object.
"
Class {
	#name : #XMLNFAMatchingState,
	#superclass : #XMLNFAState,
	#instVars : [
		'matcher',
		'nextState'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #'instance creation' }
XMLNFAMatchingState class >> matcher: aMatcher [
	^ self new matcher: aMatcher
]

{ #category : #connecting }
XMLNFAMatchingState >> connectToState: aState [
	nextState
		ifNil: [nextState := aState]
]

{ #category : #accessing }
XMLNFAMatchingState >> matcher [
	^ matcher
]

{ #category : #accessing }
XMLNFAMatchingState >> matcher: aMatcher [
	matcher := aMatcher
]

{ #category : #testing }
XMLNFAMatchingState >> matches: anObject [
	^ matcher = anObject
]

{ #category : #accessing }
XMLNFAMatchingState >> nextState [
	^ nextState
]

{ #category : #enumerating }
XMLNFAMatchingState >> nextStatesDo: aBlock [
	nextState
		ifNotNil: [aBlock value: nextState]
]

{ #category : #printing }
XMLNFAMatchingState >> printLabelOn: aStream [
	aStream
		print: self identityHash;
		nextPut: $(;
		print: matcher;
		nextPut: $)
]

{ #category : #printing }
XMLNFAMatchingState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self printLabelOn: aStream.
	aStream nextPutAll: '->'.
	nextState
		ifNotNil: [
			nextState printLabelOn: aStream].
	aStream nextPut: $).
]
