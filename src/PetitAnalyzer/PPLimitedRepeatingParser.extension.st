Extension { #name : #PPLimitedRepeatingParser }

{ #category : #'*PetitAnalyzer' }
PPLimitedRepeatingParser >> replace: aParser with: anotherParser [
	super replace: aParser with: anotherParser.
	limit == aParser ifTrue: [ limit := anotherParser ]
]
