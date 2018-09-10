"
This state can branch off into two different states without matching against anything.
"
Class {
	#name : #XMLNFABranchingState,
	#superclass : #XMLNFAState,
	#instVars : [
		'leftBranch',
		'rightBranch'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #'instance creation' }
XMLNFABranchingState class >> branch: aLeftBranch [
	^ self new
		setLeftBranch: aLeftBranch
		rightBranch: nil
]

{ #category : #'instance creation' }
XMLNFABranchingState class >> leftBranch: aLeftBranch rightBranch: aRightBranch [
	^ self new
		setLeftBranch: aLeftBranch
		rightBranch: aRightBranch
]

{ #category : #adding }
XMLNFABranchingState >> addTo: aStateSet [
	lastAddedTo == aStateSet
		ifFalse: [
			"to detect and handle cycles"
			lastAddedTo := aStateSet.

			"this is effectively a non-matching, non-accepting state
			with epsilon transitions, so it can be skipped and its
			branches can be followed (in other words, the epsilon
			closure of this state, minus this state)"
			leftBranch
				ifNotNil: [leftBranch addTo: aStateSet].
			rightBranch
				ifNotNil: [rightBranch addTo: aStateSet]]
]

{ #category : #connecting }
XMLNFABranchingState >> connectToState: aState [
	leftBranch
		ifNil: [leftBranch := aState].
	rightBranch
		ifNil: [rightBranch := aState].
]

{ #category : #accessing }
XMLNFABranchingState >> leftBranch [
	^ leftBranch
]

{ #category : #enumerating }
XMLNFABranchingState >> nextStatesDo: aBlock [
	leftBranch
		ifNotNil: [aBlock value: leftBranch].
	rightBranch
		ifNotNil: [aBlock value: rightBranch].
]

{ #category : #printing }
XMLNFABranchingState >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self printLabelOn: aStream.
	aStream nextPut: $(.
	leftBranch
		ifNotNil: [
			leftBranch printLabelOn: aStream].
	aStream nextPut: $|.
	rightBranch
		ifNotNil: [
			rightBranch printLabelOn: aStream].
	aStream nextPutAll: '))'.
]

{ #category : #accessing }
XMLNFABranchingState >> rightBranch [
	^ rightBranch
]

{ #category : #initialization }
XMLNFABranchingState >> setLeftBranch: aLeftBranch rightBranch: aRightBranch [
	leftBranch := aLeftBranch.
	rightBranch := aRightBranch.
]
