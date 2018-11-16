Extension { #name : #SmaCCParser }

{ #category : #'*SmaCC_Development' }
SmaCCParser class >> definitionAST [
	^ [ SmaCCDefinitionParser parse: self definitionString ]
		on: SmaCCParserError
		do: [ :ex | ex return: nil ]
]

{ #category : #'*SmaCC_Development' }
SmaCCParser class >> definitionString [
	| scannerClass source |
	scannerClass := [ self scannerClass ]
		on: Error
		do: [ :ex | ex return: nil ].
	(self class includesSelector: #definitionComment)
		ifTrue: [ source := self removeCommentedPartOf: (self class sourceCodeAt: #definitionComment) ]
		ifFalse: [ source := ''.
			(self class includesSelector: #parserDefinitionComment)
				ifTrue: [ source := self removeCommentedPartOf: (self class sourceCodeAt: #parserDefinitionComment) ].
			(scannerClass notNil and: [ scannerClass class includesSelector: #scannerDefinitionComment ])
				ifTrue:
					[ source := (self removeCommentedPartOf: (scannerClass class sourceCodeAt: #scannerDefinitionComment)) , '\' withCRs , source ] ].
	^ source
]

{ #category : #'*SmaCC_Development' }
SmaCCParser class >> removeCommentedPartOf: aString [
	| inStream outStream |
	inStream := ReadStream on: aString.
	outStream := WriteStream with: String new.
	inStream upTo: $".
	[ inStream atEnd ]
		whileFalse: [ (inStream peekFor: $")
				ifTrue: [ outStream nextPut: $" ].
			outStream nextPutAll: (inStream upTo: $") ].
	^ outStream contents
]
