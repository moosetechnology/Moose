Extension { #name : #SmaCCReduceAction }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCReduceAction >> simulateOn: aParserSimulator token: aSmaCCToken [
	| items |
	items := aParserSimulator popItems: lr1Item rhs size.
	aParserSimulator
		pushObject: (SmaCCReducedItem reduced: lr1Item rhs with: items)
		andState:
			(aParserSimulator
				moveOn: lr1Item rhs productionSymbol
				from: aParserSimulator parserStateId)
]
