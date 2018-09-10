Extension { #name : #PPTokenParser }

{ #category : #'*petitanalyzer-matching' }
PPTokenParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self tokenClass = aParser tokenClass ]
]
