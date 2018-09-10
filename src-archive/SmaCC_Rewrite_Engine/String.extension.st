Extension { #name : #String }

{ #category : #'*SmaCC_Rewrite_Engine' }
String >> splitFirstOn: firstCharacter andThen: secondCharacter do: aBlock [
	(self substrings: firstCharacter asString)
		do:
			[ :each | 
			| index |
			index := each indexOf: secondCharacter.
			index ~= 0
				ifTrue:
					[ aBlock
						value: (each copyFrom: 1 to: index - 1)
						value: (each copyFrom: index + 1 to: each size) ] ]
]
