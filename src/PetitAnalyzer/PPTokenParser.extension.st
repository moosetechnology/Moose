Extension { #name : #PPTokenParser }

{ #category : #'*PetitAnalyzer' }
PPTokenParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self tokenClass = aParser tokenClass ]
]
