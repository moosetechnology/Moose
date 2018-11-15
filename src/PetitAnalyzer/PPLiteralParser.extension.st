Extension { #name : #PPLiteralParser }

{ #category : #'*PetitAnalyzer' }
PPLiteralParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self literal = aParser literal and: [ self message = aParser message ] ]
]
