Extension { #name : #PPListParser }

{ #category : #'*petitanalyzer-matching' }
PPListParser >> copyInContext: aDictionary seen: aSeenDictionary [
	| copy copies |
	aSeenDictionary at: self ifPresent: [ :value | ^ value ].
	copy := aSeenDictionary at: self put: self copy.
	copies := OrderedCollection new.
	parsers do: [ :each |
		| result |
		result := each 
			copyInContext: aDictionary
			seen: aSeenDictionary.
		result isCollection
			ifTrue: [ copies addAll: result ]
			ifFalse: [ copies add: result ] ].
	^ copy
		setParsers: copies;
		yourself
]

{ #category : #'*petitanalyzer-transforming' }
PPListParser >> replace: aParser with: anotherParser [
	super replace: aParser with: anotherParser.
	parsers keysAndValuesDo: [ :index :parser |
		parser == aParser
			ifTrue: [ parsers at: index put: anotherParser ] ]
]
