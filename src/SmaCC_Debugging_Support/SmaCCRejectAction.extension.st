Extension { #name : #SmaCCRejectAction }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCRejectAction >> simulateOn: aParserSimulator token: aSmaCCToken [
	aParserSimulator killStateFrom: aSmaCCToken.
	aParserSimulator processedToken
]
