Extension { #name : #PPLiteralParser }

{ #category : #'*petitanalyzer-matching' }
PPLiteralParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self literal = aParser literal and: [ self message = aParser message ] ]
]
