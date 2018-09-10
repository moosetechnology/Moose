Extension { #name : #PPLimitedRepeatingParser }

{ #category : #'*petitanalyzer-transforming' }
PPLimitedRepeatingParser >> replace: aParser with: anotherParser [
	super replace: aParser with: anotherParser.
	limit == aParser ifTrue: [ limit := anotherParser ]
]
