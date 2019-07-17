Extension { #name : #SmaCCAcceptAction }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCAcceptAction >> simulateOn: aParserSimulator token: aSmaCCToken [
	aParserSimulator accept.
	aParserSimulator processedToken
]
