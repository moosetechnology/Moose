Extension { #name : #SmaCCShiftAction }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCShiftAction >> simulateOn: aParserSimulator token: aSmaCCToken [
	aParserSimulator
		pushObject: aSmaCCToken
		andState:
			(aParserSimulator
				moveOn: (aParserSimulator symbolForId: aSmaCCToken ids first)
				from: aParserSimulator parserStateId).
	aParserSimulator processedToken
]
