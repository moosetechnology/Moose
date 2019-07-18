Extension { #name : #SmaCCAmbiguousAction }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCAmbiguousAction >> simulateOn: aParserSimulator token: aSmaCCToken [
	| currentState uniqueActions |
	currentState := aParserSimulator currentParserState.
	uniqueActions := self uniqueActions.
	2 to: uniqueActions size do: [ :i | 
		aParserSimulator duplicateState.
		(actions at: i) simulateOn: aParserSimulator token: aSmaCCToken.
		aParserSimulator processToken.
		aParserSimulator restoreState: currentState andToken: aSmaCCToken ].
	uniqueActions first simulateOn: aParserSimulator token: aSmaCCToken
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCAmbiguousAction >> uniqueActions [
	| hasShift |
	hasShift := false.
	^ actions
		reject: [ :each | 
			| previousHasShift |
			each isShift
				and: [ previousHasShift := hasShift.
					hasShift := true.
					previousHasShift ] ]
]
