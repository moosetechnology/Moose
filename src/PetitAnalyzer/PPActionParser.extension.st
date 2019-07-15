Extension { #name : #PPActionParser }

{ #category : #'*PetitAnalyzer' }
PPActionParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self block = aParser block ]
]
