Extension { #name : #PPPluggableParser }

{ #category : #'*petitanalyzer-matching' }
PPPluggableParser >> match: aParser inContext: aDictionary seen: anIdentitySet [
	^ (super match: aParser inContext: aDictionary seen: anIdentitySet) and: [ self block = aParser block ]
]
