Class {
	#name : #XMLDFALimitsTests,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser-Validation-DFA'
}

{ #category : #tests }
XMLDFALimitsTests >> testDFAStateCacheLimit [
	| names contentModel firstState currentState visitedStates |

	names :=
		(1 to: XMLDFAStateCache new maxCachedDFAStates) collect: [:each |
			'test', each printString].

	contentModel := String streamContents: [:stream |
		stream nextPut: $(.
		names withIndexDo: [:each :i |
			i > 1
				ifTrue: [stream nextPut: $,].
			stream nextPutAll: each].
		stream nextPut: $)].

	firstState :=
		(DTDElementContentModelParser
			element: 'test'
			contentModel: contentModel) parse dfa.
	currentState := firstState.
	visitedStates := Set new.
	names withIndexDo: [:name :i | | previousState |
		visitedStates add: currentState.
		previousState := currentState.
		currentState := currentState nextDFAStateMatching: name.
		self assert: currentState notNil.
		i = names size
			ifTrue: [
				visitedStates do: [:each |
					"the cache clearing was triggered by the last match, which
					added one transition from previousState to currentState,
					but other transitions should be cleared"
					each = previousState
						ifTrue: [self assert: each dfaStateTransitions size = 1]
						ifFalse: [self assert: each dfaStateTransitions isEmpty]].
				self
					assert: firstState dfaStateTransitions isEmpty;
					assert: firstState dfaStateCache cachedDFAStates size = 2;
					assert: currentState isAccepting]
			ifFalse: [
				visitedStates do: [:each | self deny: each dfaStateTransitions isEmpty].
				self
					assert: firstState dfaStateTransitions notEmpty;
					assert: firstState dfaStateCache cachedDFAStates size = (i + 1);
					deny: currentState isAccepting]].

	currentState := firstState.
	names withIndexDo: [:each :i |
		currentState := currentState nextDFAStateMatching: each.
		self deny: currentState isNil.
		i = names size
			ifTrue: [self assert: currentState isAccepting]
			ifFalse: [self deny: currentState isAccepting]].
]

{ #category : #tests }
XMLDFALimitsTests >> testDFAStateTransitionLimit [
	| dfaState elementName |

	dfaState :=
		(DTDElementContentModelParser
			element: 'test'
			contentModel: '(test)') parse dfa.
	1 to: dfaState maxDFAStateTransitions do: [:i |
		elementName := 'test', i printString.
		dfaState nextDFAStateMatching: elementName.
		self
			assert: (dfaState dfaStateTransitions includesKey: elementName);
			assert: dfaState dfaStateTransitions size = i].

	elementName := 'test', (dfaState maxDFAStateTransitions + 1) printString.
	dfaState nextDFAStateMatching: elementName.
	self
		assert: (dfaState dfaStateTransitions includesKey: elementName);
		assert: dfaState dfaStateTransitions size = 1.
]
