Extension { #name : #PPDelegateParser }

{ #category : #'*petitanalyzer-transforming' }
PPDelegateParser >> replace: aParser with: anotherParser [
	super replace: aParser with: anotherParser.
	parser == aParser ifTrue: [ parser := anotherParser ]
]
