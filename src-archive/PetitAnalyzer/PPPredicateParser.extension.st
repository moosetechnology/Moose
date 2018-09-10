Extension { #name : #PPPredicateParser }

{ #category : #'*petitanalyzer-matching' }
PPPredicateParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self block = aParser block and: [ self message = aParser message ] ]
]
