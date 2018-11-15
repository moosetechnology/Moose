Extension { #name : #PPFailingParser }

{ #category : #'*petitanalyzer-matching' }
PPFailingParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self message = aParser message ]
]
