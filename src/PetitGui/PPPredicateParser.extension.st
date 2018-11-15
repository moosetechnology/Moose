Extension { #name : #PPPredicateParser }

{ #category : #'*PetitGui' }
PPPredicateParser >> displayName [
	^ predicateMessage
]

{ #category : #'*PetitGui' }
PPPredicateParser >> exampleOn: aStream [
	"Produce a random character that is valid. If there are characters in the alpha-numeric range prefer those over all others."

	| valid normal |
	valid := Character allCharacters
		select: [ :char | self matches: (String with: char) ].
	normal := valid
		select: [ :char | char asInteger < 127 and: [ char isAlphaNumeric ] ].
	aStream nextPut: (normal isEmpty
		ifTrue: [ valid atRandom ]
		ifFalse: [ normal atRandom ])
]
