Extension { #name : #PPPredicateSequenceParser }

{ #category : #'*PetitAnalyzer' }
PPPredicateSequenceParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self size = aParser size ]
]
