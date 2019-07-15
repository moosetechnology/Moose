Class {
	#name : #XMLNFAStateSetTest,
	#superclass : #XMLAbstractSetTest,
	#instVars : [
		'states',
		'disjointStates',
		'absentState'
	],
	#category : #'XML-Tests-Parser-Validation-DFA'
}

{ #category : #testing }
XMLNFAStateSetTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLNFAStateSetTest >> absentSetElement [
	^ absentState
		ifNil: [absentState := XMLNFAMatchingState matcher: 'absent']
]

{ #category : #accessing }
XMLNFAStateSetTest >> disjointSetElements [
	disjointStates
		ifNil: [
			disjointStates :=
				Array
					with: (XMLNFAMatchingState matcher: 'three')
					with: (XMLNFAMatchingState matcher: 'four')].
	^ disjointStates copy.
]

{ #category : #accessing }
XMLNFAStateSetTest >> setClass [
	^ XMLNFAStateSet
]

{ #category : #accessing }
XMLNFAStateSetTest >> setElements [
	states
		ifNil: [
			states :=
				Array
					with: (XMLNFAMatchingState matcher: 'one')
					with: XMLNFAAcceptingState new
					with: (XMLNFAMatchingState matcher: 'two')
					with: XMLNFAAcceptingState new].
	^ states copy.
]

{ #category : #tests }
XMLNFAStateSetTest >> testIsAccepting [
	| set isAccepting lastAccepting |

	set := self emptySet.
	isAccepting := false.
	self deny: set isAccepting.
	self setElements do: [:each |
		set add: each.
		each isAccepting
			ifTrue: [
				isAccepting := true.
				lastAccepting := each].
		self assert: set isAccepting = isAccepting].
	self assert: set isAccepting.

	self setElements do: [:each |
		set remove: each.
		(set includes: lastAccepting)
			ifTrue: [self assert: set isAccepting]
			ifFalse: [self deny: set isAccepting]].
	self deny: set isAccepting.

	self deny:
		(self setWithElements
			removeAll;
			isAccepting).
]
