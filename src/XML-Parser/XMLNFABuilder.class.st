"
This class builds an NFA using a stack of NFAFragments.
"
Class {
	#name : #XMLNFABuilder,
	#superclass : #Object,
	#instVars : [
		'fragmentStack'
	],
	#category : #'XML-Parser-Validation-DFA'
}

{ #category : #applying }
XMLNFABuilder >> applyAccepting [
	| totalFragments |

	(totalFragments := self totalFragments) > 0
		ifTrue: [
			1 to: totalFragments - 1 do: [:i |
				self applyConcatenation].
			self topFragment connectToState:
				XMLNFAAcceptingState new]
		ifFalse: [
			self pushFragment:
				(XMLNFAFragment firstState: XMLNFAAcceptingState new)]
]

{ #category : #applying }
XMLNFABuilder >> applyBranch [
	| leftFragment rightFragment branchState |

	leftFragment := self popFragment.
	rightFragment := self popFragment.
	branchState :=
		XMLNFABranchingState
			leftBranch: leftFragment firstState
			rightBranch: rightFragment firstState.

	self pushFragment:
		(XMLNFAFragment
			firstState: branchState
			terminalStates:
				(leftFragment terminalStatesWithAllFrom: rightFragment)).
]

{ #category : #applying }
XMLNFABuilder >> applyConcatenation [
	| firstFragment secondFragment |

	secondFragment := self popFragment.
	firstFragment := self popFragment.
	firstFragment connectToFragment: secondFragment.

	self pushFragment: firstFragment.
]

{ #category : #applying }
XMLNFABuilder >> applyOptional [
	| optionalFragment branchingState |

	optionalFragment := self popFragment.
	branchingState :=
		XMLNFABranchingState branch: optionalFragment firstState.

	self pushFragment:
		(XMLNFAFragment
			firstState: branchingState
			terminalStates:
				(optionalFragment terminalStatesWith: branchingState))
]

{ #category : #applying }
XMLNFABuilder >> applyPlus [
	| plusFragment |

	plusFragment := self topFragment.
	plusFragment connectToState:
		(XMLNFABranchingState branch: plusFragment firstState).
]

{ #category : #applying }
XMLNFABuilder >> applyStar [
	| branchState starFragment |

	starFragment := self popFragment.
	branchState := XMLNFABranchingState branch: starFragment firstState.
	starFragment connectToState: branchState.

	self pushFragment:
		(XMLNFAFragment
			firstState: branchState
			terminalState: branchState).
]

{ #category : #converting }
XMLNFABuilder >> asAcceptingNFA [
	^ (self
		applyAccepting;
		popFragment) firstState
]

{ #category : #private }
XMLNFABuilder >> fragmentStack [
	^ fragmentStack
]

{ #category : #testing }
XMLNFABuilder >> hasFragments [
	^ self totalFragments > 0
]

{ #category : #initialization }
XMLNFABuilder >> initialize [
	super initialize.

	fragmentStack := OrderedCollection new.
]

{ #category : #accessing }
XMLNFABuilder >> popFragment [
	^ self fragmentStack removeLast
]

{ #category : #accessing }
XMLNFABuilder >> pushFragment: aFragment [
	^ self fragmentStack addLast: aFragment
]

{ #category : #accessing }
XMLNFABuilder >> pushFragmentMatching: aMatcher [
	^ self pushFragment:
		(XMLNFAFragment firstState:
			(XMLNFAMatchingState matcher: aMatcher))
]

{ #category : #accessing }
XMLNFABuilder >> topFragment [
	^ self fragmentStack last
]

{ #category : #accessing }
XMLNFABuilder >> totalFragments [
	^ self fragmentStack size
]
