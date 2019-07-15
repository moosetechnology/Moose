Extension { #name : #SmaCCCharacterBlockRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCCharacterBlockRegexNode >> asRegularExpression [
	| characters aStream invert node |
	aStream := ReadStream on: (block value copyFrom: 2 to: block value size - 1).
	characters := OrderedCollection new.
	invert := aStream peekFor: $^.
	[ aStream atEnd ] whileFalse: [ characters addAll: (self charactersFor: aStream) ].
	node := SmaCCCharacterRENode characters: (SmaCCCharacterSet withAll: characters).
	invert
		ifTrue: [ node := SmaCCNotRENode on: node ].
	^ node
]

{ #category : #'*SmaCC_Development' }
SmaCCCharacterBlockRegexNode >> charactersFor: aStream [
	| characters char endCharacters |
	aStream atEnd
		ifTrue: [ self reportCharacterBlockError ].
	char := aStream next.
	characters := char == $\
		ifTrue: [ (self nodeFor: aStream) characters ]
		ifFalse: [ OrderedCollection with: char ].
	(characters size = 1 and: [ aStream peekFor: $- ])
		ifFalse: [ ^ characters ].
	endCharacters := self charactersFor: aStream.
	endCharacters size > 1
		ifTrue: [ self reportCharacterBlockError ].
	^ (characters first asInteger to: endCharacters first asInteger) collect: [ :each | Character value: each ]
]

{ #category : #'*SmaCC_Development' }
SmaCCCharacterBlockRegexNode >> reportCharacterBlockError [
	SmaCCParserError new
		messageText: 'Invalid character block';
		tag: block;
		signal
]
