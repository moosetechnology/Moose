Extension { #name : #SmaCCCharacterRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCCharacterRegexNode >> asRegularExpression [
	| ch |
	ch := self char value.
	ch = '.'
		ifTrue: [ ^ SmaCCCharacterRENode characters: self allCharacters ].
	ch first = $\
		ifTrue: [ ^ self nodeFor: (ReadStream on: (ch copyFrom: 2 to: ch size)) ].
	^ SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: ch)
]
